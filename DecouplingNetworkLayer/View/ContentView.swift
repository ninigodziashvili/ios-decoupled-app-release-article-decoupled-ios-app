import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DogFactsSwiftUIViewModel(repository: DogFactsRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev))
    
    var body: some View {
        NavigationView {
            VStack {
                if let factMessages = viewModel.factMessage {
                    List {
                        ForEach(factMessages, id: \.self) { message in
                            Text(message)
                        }
                    }
                    .navigationTitle("Dog Facts")
                } else {
                    ProgressView()
                }
                
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
        }
        .onAppear {
            viewModel.fetchRandomFact()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
