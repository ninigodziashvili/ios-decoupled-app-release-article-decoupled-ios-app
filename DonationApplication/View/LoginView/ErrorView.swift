import Foundation
import SwiftUI

struct ErrorView: View {
    let message: LocalizedStringKey
    
    // MARK: - Body
    
    var body: some View {
        Text(message)
            .foregroundColor(.red)
            .padding()
    }
}
