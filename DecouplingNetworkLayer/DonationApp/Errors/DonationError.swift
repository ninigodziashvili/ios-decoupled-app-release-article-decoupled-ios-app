import Foundation

enum DonationError: Error {
    case notParsable(Data)
    case fetchError(Error)
    case statement(String)
}
