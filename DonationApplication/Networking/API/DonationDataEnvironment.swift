import Foundation

// MARK: - Environment

protocol Environment {
    var baseURL: String { get }
}

struct DonationDataEnvironment: Environment {
    let baseURL: String = "https://jsonplaceholder.typicode.com/"
}
