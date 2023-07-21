//
//  StudentsList.swift
//  piedPiper
//
//  Created by Mauricio Alves da Silva Junior on 21/03/23.
//

import SwiftUI

struct StudentsList: View {
    @EnvironmentObject var modelData: ModelData
    
    var students: [Student] {
        modelData.students
    }
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(students) { student in
                    NavigationLink {
                        StudentItem(student: student)
                    } label: {
                        StudentsRow(student: student)
                    }
                }
            }
            .navigationTitle("Pied Piper")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Pied Piper")
                        .font(.title2)
                        .bold()
                }
            }
        }
    }
}

struct StudentsList_Previews: PreviewProvider {
    static var previews: some View {
        StudentsList()
            .environmentObject(ModelData())
    }
}
