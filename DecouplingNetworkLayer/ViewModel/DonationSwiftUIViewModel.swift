import Foundation

class DonationSwiftUIViewModel: ObservableObject {
    private let repository: DonationRepositoryProtocol
    
    @Published var donationData: DonationData? = .init(persons: [])
    @Published var errorMessage: String = ""
    
    init(repository: DonationRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchPersonsData() {
        repository.getPersonsLocalData { result in
            switch result {
            case .success(let name):
                self.donationData = name
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

