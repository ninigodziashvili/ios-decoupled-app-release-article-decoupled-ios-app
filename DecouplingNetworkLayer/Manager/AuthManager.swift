import Foundation

class AuthManager {
    static let shared = AuthManager()
    
    var isAuthenticated = false
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        // Simulated login process
        // Replace with actual authentication logic
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Simulate successful login for valid credentials
            let isValidCredentials = username == "your_username" && password == "your_password"
            self.isAuthenticated = isValidCredentials
            completion(isValidCredentials)
        }
    }
}
