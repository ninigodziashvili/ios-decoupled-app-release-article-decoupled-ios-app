import Lottie
import SwiftUI

struct LoginView: View {
    // MARK: - Private Properties
    
    @StateObject private var viewModel = LoginViewModel()
    @StateObject private var viewModelForgot = ForgotPasswordViewModel()
    @State private var navigateToSecondPage = true
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                LottieView(animationName: "loginAnimation")
                    .frame(height: 450)
                    .padding()
                InputFieldsView(viewModel: viewModel)
                ForgotPasswordButton(viewModel: viewModel) {
                    viewModel.isTappedForgotPassword = true
                }
                Spacer()
                if viewModel.validationError {
                    Text("Please enter Username and Password")
                        .foregroundColor(.red)
                        .font(.system(size: 14))
                        .padding(.bottom, 13)
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
            .sheet(isPresented: $viewModel.isTappedForgotPassword, content: {
                ForgotPasswordView()
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

