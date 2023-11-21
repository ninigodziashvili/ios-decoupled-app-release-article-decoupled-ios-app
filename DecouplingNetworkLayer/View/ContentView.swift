import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DonationSwiftUIViewModel(repository: DonationRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev))
    @State private var selectedFilter = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(Constants.FilterData.filter, selection: $selectedFilter) {
                    Text(Constants.FilterData.all).tag(0)
                    Text(Constants.FilterData.i).tag(1)
                    Text(Constants.FilterData.ii).tag(2)
                    Text(Constants.FilterData.iii).tag(3)
                    Text(Constants.FilterData.iv).tag(4)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if let donationData = viewModel.donationData {
                    List {
                        ForEach(filteredDonors(from: donationData.names), id: \.self) { message in
                            Text(message)
                        }
                    }
                    .navigationTitle(Constants.TitleData.donorNames)
                } else {
                    ProgressView()
                }
            }
        }
        .onAppear {
            viewModel.fetchPersonsData()
        }
    }
    
    func filteredDonors(from donationData: [String]) -> [String] {
        if selectedFilter == 0 {
            return donationData
        } else {
            return donationData.filter { donor in
                return true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
