import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DonationSwiftUIViewModel(repository: DonationRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev))
    @State private var selectedFilter = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(Constants.FilterData.filter, selection: $selectedFilter) {
                    ForEach(0..<5) { index in
                        Text(Constants.FilterData.allFilters[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if let donationData = viewModel.donationData {
                    List {
                        ForEach(filteredDonors(from: donationData.persons.map { $0.name ?? "" }), id: \.self) { message in
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
            let bloodGroup = Constants.FilterData.allFilters[selectedFilter]
            return donationData.filter { donorName in
                guard let person = viewModel.donationData?.persons.first(where: { $0.name == donorName }) else {
                    return false
                }
                return person.bloodyGroup?.rawValue == bloodGroup
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
