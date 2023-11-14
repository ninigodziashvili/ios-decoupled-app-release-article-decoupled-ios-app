protocol Environment {
    var baseURL: String { get }
}

struct DogFactsEnvironment: Environment {
    let baseURL: String = "https://dog-api.kinduff.com/api"
}
