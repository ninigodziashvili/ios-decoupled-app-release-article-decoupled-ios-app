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
    @State private var modalHeight: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                LottieView(animationName: "successAnimation")
                    .frame(maxWidth: 150, maxHeight: 150)
                    .scaleEffect(0.5)
                    .aspectRatio(contentMode: .fill)
                    .padding()
                Text(viewModel.message)
                    .font(.system(size: 16))
                    .padding()
                
                Button(action: {
                    viewModel.navigateToLoginPage()
                }) {
                    Text("Go to Login Page")
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
