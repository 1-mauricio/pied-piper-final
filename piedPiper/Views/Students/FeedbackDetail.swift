//
//  CommentDetail.swift
//  piedPiper
//
//  Created by Eduardo Dias de Oliveira Teles on 18/04/23.
//

import Foundation
import SwiftUI

struct FeedbackDetail: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var feedbackObser: FeedbackObser

    var body: some View {
        VStack(alignment: .leading) {
            Text(feedbackObser.title)
                .font(.title)
            Text(feedbackObser.teacherName)
                .font(.subheadline)
            Text(feedbackObser.date)
                .font(.footnote)
            Divider()
            Text(feedbackObser.feedback)
                .font(.body)
                .padding()
            Spacer()
        }
        .padding()
        .frame(width: 360)
        
    }
}


struct FeedbackDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        FeedbackDetail()
    }
}
