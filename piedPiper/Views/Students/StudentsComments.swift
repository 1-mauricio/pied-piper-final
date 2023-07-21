//
//  StudentsComments.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 16/04/23.
//

import SwiftUI

//struct SheetView: View {
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        Button("Dismiss") {
//            dismiss()
//
//        }
//        .font(.title)
//        .padding()
//
//    }
//}
class ModelData1: ObservableObject {
    @Published var comments = [Comment]()
}

class CommentObser: ObservableObject {
    @Published var title = ""
    @Published var teacherName = ""
    @Published var date = ""
    @Published var comment = ""
    
    init(title: String = "", teacherName: String = "", date: String = "", comment: String = "") {
        self.title = title
        self.teacherName = teacherName
        self.date = date
        self.comment = comment
    }
}

struct Comment: Hashable {
    var title: String
    var teacherName: String
    var date: String
    var comment: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(teacherName)
        hasher.combine(date)
    }
    
    static func ==(lhs: Comment, rhs: Comment) -> Bool {
        return lhs.title == rhs.title && lhs.teacherName == rhs.teacherName && lhs.date == rhs.date && lhs.comment == rhs.comment
    }
}


struct StudentsComments: View {
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    @StateObject var modelData1 = ModelData1()
    @StateObject var commentObser = CommentObser()


    
    var student: Student
    
    var comments = ["Comment 1", "Comment 2", "Comment 3"]
    var body: some View {
        NavigationView {
            List {
                HStack{
                    Text("Atraso")
                    Spacer()
                    VStack{
                        Text("Kiev Gama")
                            .font(.system(size: 15))
                            .opacity(0.5)
                        Text("13/04/2023")
                            .font(.system(size: 12))
                            .opacity(0.7)
                    }
                    Spacer()
                    Button("Show") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        CommentDetail().environmentObject(CommentObser(title: "Atraso",teacherName: "Kiev Gama",date: "13/04/2023",comment: "tá dificil ein"))
                    }
                }
                
                    ForEach(modelData1.comments, id: \.self) { item in
                        HStack {
                            Text(item.title)
                            Spacer()
                            VStack {
                                Text(item.teacherName)
                                    .font(.system(size: 15))
                                    .opacity(0.5)
                                Text(item.date)
                                    .font(.system(size: 12))
                                    .opacity(0.7)
                            }
                            Spacer()
                            Button("Show") {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                                CommentDetail().environmentObject(CommentObser(title: item.title,teacherName: item.teacherName,date: item.date,comment: item.comment))
                            }
                        }
                    }
            }
            .environmentObject(modelData1)
            .navigationTitle("Comments")
            .navigationBarItems(trailing:
                Button("Add") {
                    showingSheet2.toggle()
                }
                .sheet(isPresented: $showingSheet2) {
                    addComment().environmentObject(modelData1)
                }
            )
        }
    }

    }

struct StudentsComments_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentsComments(student: modelData.students[0])
    }
}
