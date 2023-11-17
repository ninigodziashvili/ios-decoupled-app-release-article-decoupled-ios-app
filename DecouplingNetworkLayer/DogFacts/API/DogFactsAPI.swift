import Foundation

struct DogFactsAPI {
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
}

// MARK: - Extensions

extension DogFactsAPI {
    var factsURL: URL { getURL(path: "users") }
}

// MARK: - Helpers

fileprivate extension DogFactsAPI {
    func getURL(path: String) -> URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
}

extension DogFactsAPI {
    static var dev: Self {
        DogFactsAPI(
            environment: DogFactsEnvironment()
        )
    }
}
