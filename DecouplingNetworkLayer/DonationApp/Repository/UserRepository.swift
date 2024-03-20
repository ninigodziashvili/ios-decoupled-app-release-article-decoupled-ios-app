import Foundation

class UserRepository {
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        let loginSuccess = username == "User" && password == "Password"
        completion(loginSuccess)
    }
}
