import SwiftUI

struct ContentView: View {
    // MARK: - Private Properties
    
    @StateObject private var viewModel = DonationDataViewModel(repository: DonationRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev))
    @State private var selectedFilter = 0
    
    // MARK: - Body
    
    var body: some View {
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
                        if let name = person.name, let group = person.bloodyGroup {
                            HStack {
                                Text(name)
                                Spacer()
                                Image(systemName: "drop.fill")
                                    .foregroundColor(.red)
                                if Constants.FilterData.allFilters[selectedFilter] ==  Constants.FilterData.all {
                                    Text(group.rawValue)
                                        .font(.system(size: 15))
                                }
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle(Constants.TitleData.donorNames)
                .listStyle(PlainListStyle())
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
