//
//  View+.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 29.03.24.
//

import Foundation
import SwiftUI

extension View {
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheeView: @escaping () -> SheetView) -> some View {
        return background {
            HalfSheetHelper(sheetView: sheeView(), showSheet: showSheet)
        }
    }
}
