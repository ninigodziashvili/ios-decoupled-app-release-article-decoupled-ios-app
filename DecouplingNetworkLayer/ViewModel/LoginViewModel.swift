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
    @Published var validationError = false
    
    func login() {
        guard validationInput() else { return }
        isLoggingIn = true
        userRepository.login(username: username, password: password) { [weak self] success in
            DispatchQueue.main.async {
                self?.isLoggingIn = false
                if success {
                    self?.navigateListPage()
                } else {
                    self?.authenticationFailed = true
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
    
    // MARK: - Private Methods
    
    private func validationInput() -> Bool {
        let isValid = !username.isEmpty && !password.isEmpty
        validationError = !isValid
        return isValid
    }
}
