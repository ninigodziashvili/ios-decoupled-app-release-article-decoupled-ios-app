import Lottie
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToSecondPage = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                LottieView(animationName: "loginAnimation")
                    .frame(height: 450)
                    .padding()
                InputFieldsView(viewModel: viewModel)
                if viewModel.validationError {
                    Text("Please enter Username and Password")
                        .foregroundColor(.red)
                        .padding(.top, 4)
                }
                Spacer()
                LoginButtonView(viewModel: viewModel) {
                    viewModel.login()
                    navigateToSecondPage = true
                }
                .background(
                    NavigationLink(destination: ContentView(), isActive: $viewModel.navigateToListPage) {
                        EmptyView()
                    }
                )
                
                if viewModel.isLoggingIn {
                    ProgressView()
                        .padding()
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

