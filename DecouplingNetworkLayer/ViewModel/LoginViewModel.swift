import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    private let userRepository = UserRepository()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var username = ""
    @Published var password = ""
    @Published var isLoggingIn = false
    @Published var authenticationFailed = false
    
    func login() {
        isLoggingIn = true
        userRepository.login(username: username, password: password) { [weak self] success in
            DispatchQueue.main.async {
                self?.isLoggingIn = false
                self?.authenticationFailed = !success
                
                if success {
                    AuthManager.shared.isAuthenticated = true
                    // Handle successful login
                }
            }
        }
    }
}
