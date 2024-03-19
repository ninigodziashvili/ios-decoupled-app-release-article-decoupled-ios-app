import SwiftUI
import Combine

protocol NoavigationProtocol {
    func navigateListPage()
}

class LoginViewModel: ObservableObject, NoavigationProtocol {
    private let userRepository = UserRepository()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var username = ""
    @Published var password = ""
    @Published var isLoggingIn = false
    @Published var authenticationFailed = false
    @Published var navigateToListPage = false
    
    func login() {
        isLoggingIn = true
        userRepository.login(username: username, password: password) { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    self?.navigateListPage()
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
}  
