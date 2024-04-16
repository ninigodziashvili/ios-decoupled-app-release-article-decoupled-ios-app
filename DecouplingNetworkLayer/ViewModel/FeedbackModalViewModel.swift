//
//  FeedbackModalViewModel.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 27.03.24.
//

import Foundation

class FeedbackModalViewModel: ObservableObject {
    @Published var message: String = "Successfully sent a link to your email. Please check your email to reset your password."
    @Published var dismissFeedback = false

    func dismiss() {
        // Perform any necessary actions before dismissing the modal
        dismissFeedback = true
    }
}
