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
                if viewModel.validationError {
                    Text("Please enter Username and Password")
                        .foregroundColor(.red)
                        .padding(.top, 4)
                }
            
                Button ("Forgot Password?") {
                    viewModel.handleForgotPassword()
                }
                .padding(.trailing, 20)
                .padding(.bottom, 65)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .foregroundColor(.gray)
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
                
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

