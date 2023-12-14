import Lottie
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 5) {
            LottieView(animationName: "loginAnimation")
                .frame(height: 450)
                .padding()
            InputFieldsView(viewModel: viewModel)
            Spacer()
            LoginButtonView(viewModel: viewModel)
            if viewModel.isLoggingIn {
                ProgressView()
                    .padding()
            }
            if viewModel.authenticationFailed {
                ErrorView(message: LocalizedStringKey("errorMessage"))
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

