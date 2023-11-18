import Foundation

class DonationSwiftUIViewModel: ObservableObject {
    private let repository: DonationRepositoryProtocol
    
    @Published var factMessage: DonationData? = .init(names: [])
    @Published var errorMessage: String = ""
    
    init(repository: DonationRepositoryProtocol) {
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

