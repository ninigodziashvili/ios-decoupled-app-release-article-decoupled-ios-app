import Foundation
import SwiftUI

struct ErrorView: View {
    let error: ErrorMessage
    var retryAction: (() -> Void)?
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text(error.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.red)
            Text(error.message)
                .font(.body)
                .multilineTextAlignment(.center)
            if let retryAction {
                Button(action: retryAction) {
                    Text("")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .cornerRadius(10)
        .background(Color.white)
        .shadow(radius: 10)
    }
}
