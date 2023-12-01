struct DonationData {
    var persons: [Person]
}
extension DonationData {
    static var empty: DonationData { DonationData(persons: []) }
}
