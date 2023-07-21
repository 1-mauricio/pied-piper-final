//
//  StudentsFeedbacks.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 16/04/23.
//

import SwiftUI
class ModelData2: ObservableObject {
    @Published var feedbacks = [Feedback]()
}
class FeedbackObser: ObservableObject {
    @Published var title = ""
    @Published var teacherName = ""
    @Published var date = ""
    @Published var feedback = ""
    
    init(title: String = "", teacherName: String = "", date: String = "", feedback: String = "") {
        self.title = title
        self.teacherName = teacherName
        self.date = date
        self.feedback = feedback
    }
}
struct Feedback: Hashable {
    var title: String
    var teacherName: String
    var date: String
    var feedback: String

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(teacherName)
        hasher.combine(date)
        hasher.combine(feedback)
    }
    
    static func ==(lhs: Feedback, rhs: Feedback) -> Bool {
        return lhs.title == rhs.title && lhs.teacherName == rhs.teacherName && lhs.date == rhs.date && lhs.feedback == rhs.feedback
    }
}

struct StudentsFeedbacks: View {
    @State private var showingSheet = false
    var student: Student
    @State private var showingSheet2 = false
    @StateObject var modelData2 = ModelData2()
    @StateObject var feedbackObser = FeedbackObser()

    var feedbacks = ["Feedback 1", "Feedback 2", "Feedback 3"]
    
    var body: some View {
        NavigationView {
            List {
                HStack{
                    Text("Pouco Participativo")
                    Spacer()
                    VStack{
                        Text("Kiev Gama")
                            .font(.system(size: 15))
                            .opacity(0.5)
                        Text("17/04/2023")
                            .font(.system(size: 12))
                            .opacity(0.7)
                    }
                Spacer()
                Button("Show") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    FeedbackDetail().environmentObject(FeedbackObser(title: "Pouco Participativo",teacherName: "Kiev Gama",date: "17/04/2023",feedback: "muito bom"))
                    }
                }
                ForEach(modelData2.feedbacks, id: \.self) { item in
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
                            FeedbackDetail().environmentObject(FeedbackObser(title: item.title,teacherName: item.teacherName,date: item.date,feedback: item.feedback))
                        }
                    }
                }
            }
            .environmentObject(modelData2)
            .navigationTitle("Feedbacks")
            .navigationBarItems(trailing:
                Button("Add") {
                    showingSheet2.toggle()
                }
                .sheet(isPresented: $showingSheet2) {
                    addFeedback().environmentObject(modelData2)
                }
            )

            }
        }
    }
struct StudentsFeedbacks_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StudentsFeedbacks(student: modelData.students[0])
    }
    
}
