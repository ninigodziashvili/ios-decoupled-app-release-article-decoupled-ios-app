struct DogFactData: RandomAccessCollection {
    var names: [String]
    
    var startIndex: Int { names.startIndex }
    var endIndex: Int { names.endIndex }
    
    subscript(position: Int) -> String {
        return names[position]
    }
}
extension DogFactData {
    static var empty: DogFactData { DogFactData(names: []) }
}
