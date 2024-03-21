import Foundation

struct PersonAPI {
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
}

// MARK: - Extension

extension PersonAPI {
    var personsURL: URL { getURL(path: "users") }
}

// MARK: - Helpers

fileprivate extension PersonAPI {
    private func getURL(path: String) -> URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
}

extension PersonAPI {
    static var dev: Self {
        PersonAPI(
            environment: DonationEnvironment()
        )
    }
}
