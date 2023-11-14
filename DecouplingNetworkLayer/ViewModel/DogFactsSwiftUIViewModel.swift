import Foundation

class DogFactsSwiftUIViewModel: ObservableObject {
    private let repository: DogFactsRepository
    
    @Published var factMessage: DogFactData? = .init(factMessage: "")
    @Published var errorMessage: String = ""
    
    init(repository: DogFactsRepository) {
        self.repository = repository
    }
    
    func fetchRandomFact() {
        repository.getRandomFact { result in
            switch result {
            case .success(let fact):
                self.factMessage = fact
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

