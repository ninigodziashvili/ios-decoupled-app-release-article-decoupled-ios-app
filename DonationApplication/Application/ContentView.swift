//
//  ContentView.swift
//  DonationApplication
//
//  Created by Nino Godziashvili on 03.07.24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var forgotPasswordViewModel = ForgotPasswordViewModel()
    @StateObject private var feedbackViewModel = FeedbackDataViewModel()
    
    var body: some View {
        LoginView()
            .environmentObject(loginViewModel)
            .environmentObject(forgotPasswordViewModel)
            .environmentObject(feedbackViewModel)
    }
}
