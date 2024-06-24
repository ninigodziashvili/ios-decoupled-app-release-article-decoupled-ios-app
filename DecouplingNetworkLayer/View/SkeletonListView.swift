import Foundation
import SwiftUI

// MARK: - Skeleton

struct SkeletonListView: View {
    var body: some View {
        List {
            ForEach(0..<10, id: \.self) { _ in
                SkeletonRowView()
            }
        }
    }
}

struct SkeletonRowView: View {
    // MARK: - Body
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 25)
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 25, height: 20)
        }
        .padding()
    }
}
