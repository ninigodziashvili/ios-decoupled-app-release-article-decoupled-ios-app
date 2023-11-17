protocol Environment {
    var baseURL: String { get }
}

struct DogFactsEnvironment: Environment {
    let baseURL: String = "https://jsonplaceholder.typicode.com/"
}
