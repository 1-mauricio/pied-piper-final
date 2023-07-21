//
//  addFeedback.swift
//  piedPiper
//
//  Created by José on 26/04/23.
//

import SwiftUI

struct addFeedback: View {
    @State private var title = ""
       @State private var teacherName = ""
       @State private var date = ""
    @State private var feedback = ""

    @EnvironmentObject var modelData2: ModelData2

       var body: some View {
           VStack {
               TextField("Title", text: $title)
                   .padding()
                   .foregroundColor(Color.black)
                   .textFieldStyle(.roundedBorder)
               TextField("Teacher Name", text: $teacherName)
                   .padding()
                   .textFieldStyle(.roundedBorder)
               TextField("Date", text: $date)
                   .padding()
                   .textFieldStyle(.roundedBorder)
               TextField("Feedback", text: $feedback)
                   .padding()
                   .textFieldStyle(.roundedBorder)
               Button("Save") {
                   let feedback = Feedback(title: title, teacherName: teacherName, date: date, feedback: feedback)
                   modelData2.feedbacks.append(feedback)
                   // Adicione aqui a lógica para salvar o comentário
               }
           }
       }
}

struct addFeedback_Previews: PreviewProvider {
    static var previews: some View {
        addFeedback()
    }
}
