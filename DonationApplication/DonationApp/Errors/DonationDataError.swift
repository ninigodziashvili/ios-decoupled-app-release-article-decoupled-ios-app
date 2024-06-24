import Foundation

enum DonationDataError: Error {
    case notParsable(Data)
    case fetchError(Error)
    case statement(String)
}
