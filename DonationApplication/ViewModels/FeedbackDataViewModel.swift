//
//  FeedbackModalViewModel.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 27.03.24.
//

import Foundation

class FeedbackDataViewModel: ObservableObject {
    @Published var message: String = "Successfully sent a link to your email. Please check your email to reset your password."
    @Published var dismissFeedback = false

    func dismiss() {
        dismissFeedback = true
    }
}
