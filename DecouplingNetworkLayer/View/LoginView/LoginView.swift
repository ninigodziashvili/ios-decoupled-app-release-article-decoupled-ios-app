import Lottie
import SwiftUI

struct LoginView: View {
    // MARK: - Private Properties
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToSecondPage = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                LottieView(animationName: "loginAnimation")
                    .frame(height: 450)
                    .padding()
                InputFieldsView(viewModel: viewModel)
                Button {
                    viewModel.handleForgotPassword()
                } label: {
                    Text("Forgot Password?")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 56)
                .frame(maxWidth: .infinity, alignment: .trailing)
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
                // Add the Forgot Password view here if needed
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

