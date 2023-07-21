//
//  CommentDetail.swift
//  piedPiper
//
//  Created by Eduardo Dias de Oliveira Teles on 18/04/23.
//

import Foundation
import SwiftUI

struct CommentDetail: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var commentObser: CommentObser

    var body: some View {
        VStack(alignment: .leading) {
            Text(commentObser.title)
                .font(.title)
            Text(commentObser.teacherName)
                .font(.subheadline)
            Text(commentObser.date)
                .font(.footnote)
            Divider()
            Text(commentObser.comment)
                .fontDesign(.rounded)
                .padding()
            
            Spacer()
        }
        .padding()
        .frame(width: 360)
        
    }
}


struct CommentDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CommentDetail()
    }
}
