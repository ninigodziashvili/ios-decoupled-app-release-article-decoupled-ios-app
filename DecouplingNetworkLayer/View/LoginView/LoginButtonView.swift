import Foundation
import SwiftUI

struct LoginButtonView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        Button(action: {
            viewModel.login()
        }) {
            Text("Login")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 53/255, green: 53/255, blue: 53/255))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
