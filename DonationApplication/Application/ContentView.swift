//
//  ContentView.swift
//  DonationApplication
//
//  Created by Nino Godziashvili on 03.07.24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    // MARK: - Private Properties
    
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var forgotPasswordViewModel = ForgotPasswordViewModel()
    @StateObject private var feedbackDataViewModel = FeedbackDataViewModel()
    @EnvironmentObject private var router: Router
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            switch router.currentRoute {
            case .login:
                LoginView()
                    .environmentObject(loginViewModel)
            case .forgotPassword:
                ForgotPasswordView()
                    .environmentObject(forgotPasswordViewModel)
            case .feedbackPage:
                FeedbackView()
                    .environmentObject(feedbackDataViewModel)
            case .donorsMainList:
                DonorsMainListView()
            case nil:
                Text("Route not found")
            }
        }
        .environmentObject(router)
    }
}
