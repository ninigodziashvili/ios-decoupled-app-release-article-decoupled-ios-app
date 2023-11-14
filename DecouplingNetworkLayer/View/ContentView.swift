import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DogFactsSwiftUIViewModel(repository: DogFactsRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev))
    
    var body: some View {
        VStack {
            Text(viewModel.factMessage?.factMessage ?? "")
                .padding()
            
            Button("Fetch Another Fact") {
                viewModel.fetchRandomFact()
            }
            .padding()
            
            if !viewModel.errorMessage.isEmpty {
                Text("Error: \(viewModel.errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .onAppear {
            viewModel.fetchRandomFact()
        }
    }
}
