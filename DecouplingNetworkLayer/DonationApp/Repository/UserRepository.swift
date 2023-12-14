import Foundation

class UserRepository {
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Simulate successful login for valid credentials
            let isValidCredentials = username == "your_username" && password == "your_password"
            completion(isValidCredentials)
        }
    }
}
