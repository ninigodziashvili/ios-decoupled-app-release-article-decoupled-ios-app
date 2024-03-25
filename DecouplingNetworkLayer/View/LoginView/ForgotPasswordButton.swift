//
//  ForgotPassword.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 23.03.24.
//

import SwiftUI
import Foundation

struct ForgotPasswordButton: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var action: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        Text("Forgot Password?")
            .font(.system(size: 12))
            .fontWeight(.medium)
            .foregroundColor(.gray)
            .padding(.trailing, 20)
            .padding(.bottom, 56)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
