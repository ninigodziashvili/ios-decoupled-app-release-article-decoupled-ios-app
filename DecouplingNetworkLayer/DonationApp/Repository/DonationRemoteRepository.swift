import Foundation

protocol DonationRepositoryProtocol {
    typealias DonationResult = Result<DonationData, DonationError>
    func getPersons(handler: @escaping (DonationResult) -> Void)
    func getPersonsLocalData(handler: @escaping (DonationResult) -> Void)
}

final public class DonationRemoteRepository: DonationRepositoryProtocol {
    private let httpClient: HTTPClient
    private let api: PersonAPI
    private let executionQueue: DispatchQueue
    
    internal init(
        httpClient: HTTPClient,
        api: PersonAPI,
        executionQueue: DispatchQueue = .main
    ) {
        self.httpClient = httpClient
        self.api = api
        self.executionQueue = executionQueue
    }
    
    // MARK: - DonationRepository
    
    func getPersons(handler: @escaping (DonationResult) -> Void) {
        httpClient.get(api.personsURL) { [weak self] result in
            self?.execute {
                switch result {
                case .success(let data):
                    if let persons = Self.parse(type: Persons.self, data: data) {
                        let personData = Person.namesData(from: persons)
                        handler(.success(personData))
                    } else {
                        handler(.failure(.notParsable(data)))
                    }
                case .failure(let error):
                    handler(.failure(.fetchError(error)))
                }
            }
        }
    }
    
    func getPersonsLocalData(handler: @escaping (DonationResult) -> Void) {
        guard let path = Bundle.main.path(forResource: "personsJsonData", ofType: "json") else {
            handler(.failure(.statement(Constants.ErrorHandling.fileNotFoundError)))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            if let persons = DonationRemoteRepository.parse(type: [Person].self, data: data) {
                let personData = Person.namesData(from: persons)
                handler(.success(personData))
            } else {
                handler(.failure(.notParsable(data)))
            }
        } catch {
            handler(.failure(.statement(Constants.ErrorHandling.fileNotFoundError)))
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
    static func namesData(from persons: Persons) -> DonationData {
        let persons = persons.compactMap { $0 }
        return DonationData(persons: persons)
    }
}
