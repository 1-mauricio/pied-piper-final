//
//  addComment.swift
//  piedPiper
//
//  Created by José on 25/04/23.
//

import SwiftUI

struct addComment: View {
    @State private var title = ""
       @State private var teacherName = ""
       @State private var date = ""
    @State private var comment = ""

    @EnvironmentObject var modelData1: ModelData1

       var body: some View {
           VStack {
               TextField("Motive", text: $title)
                   .padding()
                   .foregroundColor(Color.black)
                   .textFieldStyle(.roundedBorder)
               TextField("Teacher Name", text: $teacherName)
                   .padding()
                   .textFieldStyle(.roundedBorder)
               TextField("Date", text: $date)
                   .padding()
                   .textFieldStyle(.roundedBorder)
               TextField("Comment", text: $comment)
                   .padding()
                   .textFieldStyle(.roundedBorder)
               Button("Save") {
                   let comment = Comment(title: title, teacherName: teacherName, date: date, comment: comment)
                   modelData1.comments.append(comment)
                   // Adicione aqui a lógica para salvar o comentário
               }
           }
       }
}

struct addComment_Previews: PreviewProvider {
    static var previews: some View {
        addComment()
    }
}
