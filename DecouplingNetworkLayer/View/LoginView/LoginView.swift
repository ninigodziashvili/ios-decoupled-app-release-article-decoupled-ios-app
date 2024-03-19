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
                Spacer()
                LoginButtonView(viewModel: viewModel) {
                    viewModel.navigateListPage()
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
                if !viewModel.authenticationFailed {
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

