//
//  FeedbackModalView.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 27.03.24.
//

import Foundation
import SwiftUI
import Lottie

struct FeedbackModalView: View {
    @ObservedObject var viewModel = FeedbackModalViewModel()
    
    // Mark: Body
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                LottieView(animationName: "successAnimation")
                    .frame(maxWidth: 100, maxHeight: 200)
                    .scaleEffect(0.5)
                    .aspectRatio(contentMode: .fill)
                    .padding()
                Text(viewModel.message)
                    .font(.system(size: 16))
                    .padding()
                Button(action: {
                    viewModel.dismiss()
                }) {
                    Text("Done")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 53/255, green: 53/255, blue: 53/255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

struct FeedbackModalView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackModalView()
    }
}
