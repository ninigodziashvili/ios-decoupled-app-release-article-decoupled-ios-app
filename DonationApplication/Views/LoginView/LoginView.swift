import Lottie
import SwiftUI

struct LoginView: View {
    // MARK: - Private Properties
    
    @StateObject private var viewModel = LoginViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                LottieView(animationName: "loginAnimation")
                    .frame(height: 450)
                    .padding()
                InputFieldsView(viewModel: viewModel)
                NavigationLink(destination: ForgotPasswordView(), isActive: $viewModel.isTappedForgotPassword) {
                    ForgotPasswordButtonView(viewModel: viewModel) {
                        viewModel.isTappedForgotPassword = true
                    }
                }
                Spacer()
                if let error = viewModel.errorMessage {
                    ErrorView(error: error)
                        .foregroundColor(.red)
                        .font(.system(size: 14))
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, -45)
                }
                Spacer()
                LoginButtonView(viewModel: viewModel) {
                    viewModel.login()
                }
                .background(
                    NavigationLink(destination: DonorsMainListView(), isActive: $viewModel.navigateToListPage) {
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

