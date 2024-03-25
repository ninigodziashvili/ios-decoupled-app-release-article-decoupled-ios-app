//
//  ForgotPasswordViewModel.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 25.03.24.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    
    public func resetPassword() {
    }
}
