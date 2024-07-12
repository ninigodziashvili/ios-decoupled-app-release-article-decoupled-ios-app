import SwiftUI

@main
struct DonationApplication: App {
    // MARK: - Private Properties
    
    @StateObject private var router = Router()
    @StateObject private var forgotPasswordViewModel = ForgotPasswordViewModel()
    @StateObject private var feedbackDataViewModel = FeedbackDataViewModel()
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .environmentObject(forgotPasswordViewModel)
                .environmentObject(feedbackDataViewModel)
        }
    }
}
