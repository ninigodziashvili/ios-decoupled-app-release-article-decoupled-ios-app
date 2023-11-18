protocol Environment {
    var baseURL: String { get }
}

struct DonationEnvironment: Environment {
    let baseURL: String = "https://jsonplaceholder.typicode.com/"
}
