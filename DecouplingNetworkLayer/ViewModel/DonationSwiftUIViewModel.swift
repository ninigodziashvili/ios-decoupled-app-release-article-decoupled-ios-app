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
    
    func filteredPersons(from persons: [Person], by selectedFilter: Int) -> [Person] {
        if selectedFilter == 0 {
            return persons
        } else {
            let bloodGroup = Constants.FilterData.allFilters[selectedFilter]
            return persons.filter { $0.bloodyGroup?.rawValue == bloodGroup }
        }
    }
}

