import Foundation
import SwiftUI

struct ErrorView: View {
    let message: LocalizedStringKey
    
    var body: some View {
        Text(message)
            .foregroundColor(.red)
            .padding()
    }
}
