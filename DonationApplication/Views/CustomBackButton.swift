//
//  CustomButtonView.swift
//  DonationApplication
//
//  Created by Nino Godziashvili on 19.07.24.
//

import Foundation
import SwiftUI

struct CustomBackButton: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        Button(action: {
            router.pop()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            Spacer()
        }
        .padding()
    }
}
