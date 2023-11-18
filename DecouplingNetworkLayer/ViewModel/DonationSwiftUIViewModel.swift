import Foundation

class DonationSwiftUIViewModel: ObservableObject {
    private let repository: DonationRepositoryProtocol
    
    @Published var donationData: DonationData? = .init(names: [])
    @Published var errorMessage: String = ""
    
    init(repository: DonationRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchPersonsData() {
        repository.getPersons { result in
            switch result {
            case .success(let name):
                self.donationData = name
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

