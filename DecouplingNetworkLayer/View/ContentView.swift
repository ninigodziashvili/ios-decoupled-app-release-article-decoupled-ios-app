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
                        ForEach(filteredPersons(from: donationData.persons), id: \.id) { person in
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
    
    func filteredPersons(from persons: [Person]) -> [Person] {
        if selectedFilter == 0 {
            return persons
        } else {
            let bloodGroup = Constants.FilterData.allFilters[selectedFilter]
            return persons.filter { $0.bloodyGroup?.rawValue == bloodGroup }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
