import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DonationSwiftUIViewModel(repository: DonationRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev))
    
    var body: some View {
        NavigationView {
            VStack {
                if let donationData = viewModel.donationData {
                    List {
                        ForEach(donationData, id: \.self) { message in
                            Text(message)
                        }
                    }
                    .navigationTitle("Donor Names")
                } else {
                    ProgressView()
                }
                
                Button("Fetch Another name") {
                    viewModel.fetchPersonsData()
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
            viewModel.fetchPersonsData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
