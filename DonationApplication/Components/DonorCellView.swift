//
//  DonorCellView.swift
//  DonationApplication
//
//  Created by Nino Godziashvili on 03.07.24.
//

import SwiftUI

struct DonorCellView: View {
    let name: String
    let group: String
    let showGroup: Bool
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Image(systemName: "drop.fill")
                .foregroundColor(.red)
            if showGroup {
                Text(group)
                    .font(.system(size: 15))
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 0)
        .padding(.vertical, 5)
    }
}
