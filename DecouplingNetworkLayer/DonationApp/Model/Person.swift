import Foundation

public struct Person: Codable {
    public var id: Int?
    public var name: String?
    public var username: String?
    public var email: String?
    public var bloodyGroup: BloodyGroup?
    public var address: Address?
    public var phone: String?
    public var website: String?
    public var company: Company?
}

public enum BloodyGroup: String, Codable {
    case I
    case II
    case III
    case IV
}

// MARK: - Address

public struct Address: Codable {
    public var street: String?
    public var suite: String?
    public var city: String?
    public var zipcode: String?
    public var geo: Location?
}

// MARK: - Geo

public struct Location: Codable {
    public var lat: String?
    public var lng: String?
}

// MARK: - Company

public struct Company: Codable {
    public var name: String?
    public var catchPhrase: String?
    public var bs: String?
}

public typealias  Persons = [Person]
