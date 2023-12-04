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
                        ForEach(viewModel.filteredPersons(from: donationData.persons, by: selectedFilter), id: \.id) { person in
                            if let name = person.name {
                                HStack {
                                    Text(name)
                                    Spacer()
                                    if let group = person.bloodyGroup {
                                        if selectedFilter == 0 {
                                            BloodyIconView(group: group)
                                        }
                                    }
                                }
                            }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
