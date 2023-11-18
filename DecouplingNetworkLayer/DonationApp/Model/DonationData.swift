struct DonationData: RandomAccessCollection {
    var names: [String]
    
    var startIndex: Int { names.startIndex }
    var endIndex: Int { names.endIndex }
    
    subscript(position: Int) -> String {
        return names[position]
    }
}
extension DonationData {
    static var empty: DonationData { DonationData(names: []) }
}
