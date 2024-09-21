import Foundation

class DonationDataViewModel: ObservableObject {
    // MARK: - Properties
    
    private let repository: DonationRepositoryProtocol
    
    @Published var donationData: DonationData? = .init(persons: [])
    @Published var errorMessage: String = ""
    @Published var searchText: String = ""
    
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
        // Apply filter by selected filter
        var filtered = persons
        
        if selectedFilter != 0 {
            let bloodGroup = Constants.FilterData.allFilters[selectedFilter]
            filtered = filtered.filter { person in
                person.bloodyGroup?.rawValue == bloodGroup
            }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { person in
                let nameMatches = person.name?.localizedCaseInsensitiveContains(searchText) ?? false
                let usernameMatches = person.username?.localizedCaseInsensitiveContains(searchText) ?? false
                let emailMatches = person.email?.localizedCaseInsensitiveContains(searchText) ?? false
                let phoneMatches = person.phone?.localizedCaseInsensitiveContains(searchText) ?? false
                let websiteMatches = person.website?.localizedCaseInsensitiveContains(searchText) ?? false
                return nameMatches || usernameMatches || emailMatches || phoneMatches || websiteMatches
            }
        }
        
        return filtered
    }
}

