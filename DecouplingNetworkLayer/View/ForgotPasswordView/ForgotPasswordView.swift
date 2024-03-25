//
//  ForgotPasswordView.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 25.03.24.
//

import Foundation
import SwiftUI

struct ForgotPasswordView: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()
    
    // Mark: Body
    
    var body: some View {
        VStack(alignment: .center , spacing: 100) {
            VStack(alignment: .leading, spacing: 30) {
                Text("Forgot Password")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Enter your email to reset your password")
                    .foregroundColor(.gray)
            }
            .padding()
            VStack(spacing: 40) {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    viewModel.resetPassword()
                }) {
                    Text("Continue")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 53/255, green: 53/255, blue: 53/255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
