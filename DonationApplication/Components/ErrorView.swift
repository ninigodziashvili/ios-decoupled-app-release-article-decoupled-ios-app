import Foundation
import SwiftUI

struct ErrorView: View {
    let error: ErrorMessage
    
    var body: some View {
        Text(error.message)
    }
}
