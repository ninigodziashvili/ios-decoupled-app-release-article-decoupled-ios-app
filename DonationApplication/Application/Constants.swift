import Foundation

// MARK: - Constants

struct Constants {
    struct FilterData {
        static let filter = "Filter"
        static let all = "All"
        static let first = "I"
        static let second = "II"
        static let third = "III"
        static let fourth = "IV"
        static let allFilters = [all, first, second, third, fourth]
    }
    
    struct TitleData {
        static let donorNames = "Donors"
    }
    
    struct ErrorHandling {
        static let fileNotFoundError = "Local JSON file not found"
    }
}
