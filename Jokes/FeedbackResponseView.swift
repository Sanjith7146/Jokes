//
//  FeedbackResponseView.swift
//  Jokes
//
//  Created by sanjithsethu on 18/12/21.
//

import SwiftUI

struct FeedbackResponseView: View {
    var isPositive: Bool
    var body: some View {
        VStack {
            Image(isPositive ? "happy" : "sad")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(isPositive ? "Thanks, here's a cookie 🍪!" : "Very mean. No Milo for you.")
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 0.5882352941176471, green: 0.40784313725490196, blue: 0.44313725490196076))
                .font(.system(size: 26))
                .multilineTextAlignment(.center)
                .padding()
                }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.8705882352941177, green: 0.8588235294117647, blue: 0.8235294117647058))
        .edgesIgnoringSafeArea(.all)
        
            }
    }

struct FeedbackResponseView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackResponseView(isPositive: true)
        FeedbackResponseView(isPositive: false)
    }
}

