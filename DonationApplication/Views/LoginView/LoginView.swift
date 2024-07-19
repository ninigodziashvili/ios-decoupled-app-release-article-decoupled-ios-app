import Lottie
import SwiftUI

struct LoginView: View {
    // MARK: - Private Properties
    
    @EnvironmentObject private var loginViewModel: LoginViewModel
    @EnvironmentObject private var router: Router
    
    private var errorMessage = ErrorMessage(message: "Please fill in all fields.")
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            LottieView(animationName: "loginAnimation")
                .frame(height: 450)
                .padding()
            
            InputFieldsView(viewModel: loginViewModel)
            
            ForgotPasswordButtonView(viewModel: loginViewModel) {
                loginViewModel.isTappedForgotPassword = true
                router.navigate(to: .forgotPassword)
            }
            
            Spacer()
            
            if let error = loginViewModel.errorMessage {
                ErrorView(error: error)
                    .foregroundColor(.red)
                    .font(.system(size: 14))
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, -45)
            } else if loginViewModel.isLoggingIn {
                Text(errorMessage.message)
                    .foregroundColor(.red)
                    .font(.system(size: 14))
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, -45)
            }
            
            Spacer()
            
            LoginButtonView(viewModel: loginViewModel) {
                loginViewModel.login()
                if loginViewModel.isLoggingIn {
                    router.navigate(to: .donorsMainList)
                }
            }
            
            if loginViewModel.isLoggingIn {
                ProgressView()
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(LoginViewModel())
            .environmentObject(Router())
    }
}

