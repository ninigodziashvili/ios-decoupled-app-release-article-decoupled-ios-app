import Foundation
import SwiftUI

public struct BloodyIconView: View {
    public let group: BloodyGroup
    
    public var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<numberOfIcons(), id: \.self) { _ in
                Image(systemName: "drop.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
            }
        }
    }
    
    func numberOfIcons() -> Int {
        switch group {
        case .I: return 1
        case .II: return 2
        case .III: return 3
        case .IV: return 4
        }
    }
}
