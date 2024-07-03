import SwiftUI

struct DonorsMainListView: View {
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
                            DonorCellView(
                                name: name,
                                group: group.rawValue,
                                showGroup: Constants.FilterData.allFilters[selectedFilter] == Constants.FilterData.all
                            )
                        }
                    }
                }
                .navigationTitle(Constants.TitleData.donorNames)
                .listStyle(PlainListStyle())
                .background(Color(UIColor.systemGroupedBackground))
            }
        }
        .onAppear {
            viewModel.fetchPersonsData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DonorsMainListView()
    }
}
