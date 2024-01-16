import SwiftUI
import Foundation

struct InputFieldsView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: -10) {
            TextField(LocalizedStringKey("Enter Username"), text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField(LocalizedStringKey("Enter Password"), text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}
