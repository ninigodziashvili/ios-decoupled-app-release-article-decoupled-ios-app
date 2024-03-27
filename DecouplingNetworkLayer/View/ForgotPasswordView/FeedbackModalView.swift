//
//  FeedbackModalView.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 27.03.24.
//

import Foundation
import SwiftUI

struct FeedbackModalView: View {
    @ObservedObject var viewModel: FeedbackModalViewModel
    
    // Mark: Body
    
    var body: some View {
        VStack {
            Text(viewModel.message)
                .font(.title)
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
