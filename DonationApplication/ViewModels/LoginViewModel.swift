import SwiftUI
import Combine

protocol NoavigationProtocol {
    func navigateListPage()
}

class LoginViewModel: ObservableObject, NoavigationProtocol {
    // MARK: - Properties
    
    private let userRepository = UserRepository()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var username = ""
    @Published var password = ""
    @Published var isLoggingIn = false
    @Published var authenticationFailed = false
    @Published var navigateToListPage = false
    @Published var errorMessage: ErrorMessage?
    @Published var isTappedForgotPassword = false
    
    func login() {
        guard validationInput() else { return }
        isLoggingIn = true
        userRepository.login(username: username, password: password) { [weak self] success in
            DispatchQueue.main.async {
                self?.isLoggingIn = false
                if success {
                    self?.navigateListPage()
                } else {
                    self?.errorMessage = ErrorMessage(message: "Authentication failed. Please try again.")
                }
            }
        }
    }
    
    func navigateListPage() {
        guard !username.isEmpty, !password.isEmpty else {
            self.navigateToListPage = false
            return
        }
        navigateToListPage = true
    }
    
    func handleForgotPassword() {
        isTappedForgotPassword = true
    }
    
    // MARK: - Private Methods
    
    private func validationInput() -> Bool {
        let isValid = !username.isEmpty && !password.isEmpty
        if !isValid {
            errorMessage = ErrorMessage(message: "Please enter Username and Password")
        }
        return isValid
    }
}
