import Foundation

protocol DogFactsRepository {
    typealias DogFactResult = Result<DogFactData, DogFactError>
    func getRandomFact(handler: @escaping (DogFactResult) -> Void)
}

final public class DogFactsRemoteRepository: DogFactsRepository {
    private let httpClient: HTTPClient
    private let api: DogFactsAPI
    private let executionQueue: DispatchQueue
    
    internal init(
        httpClient: HTTPClient,
        api: DogFactsAPI,
        executionQueue: DispatchQueue = .main
    ) {
        self.httpClient = httpClient
        self.api = api
        self.executionQueue = executionQueue
    }
    
    // MARK: - DogFactsRepository
    
    func getRandomFact(handler: @escaping (DogFactResult) -> Void) {
        httpClient.get(api.factsURL) { [weak self] result in
            self?.execute {
                switch result {
                case .success(let data):
                    if let persons = Self.parse(type: Persons.self, data: data) {
                        let dogFactData = Person.namesData(from: persons)
                        handler(.success(dogFactData))
                    } else {
                        handler(.failure(.notParsable(data)))
                    }
                case .failure(let error):
                    handler(.failure(.fetchError(error)))
                }
            }
        }
    }
    
    // MARK: - Helpers
    
    private func execute(action: @escaping () -> Void) {
        executionQueue.async(execute: action)
    }
    
    private static func parse<T: Decodable>(type: T.Type, data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}

fileprivate extension Person {
    static func namesData(from persons: Persons) -> DogFactData {
        let names = persons.compactMap { $0.name }
        return DogFactData(names: names)
    }
}
