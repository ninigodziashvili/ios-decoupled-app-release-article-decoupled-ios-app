//
//  AdaptiveSheetPresentationModifier.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 28.03.24.
//

import Foundation
import SwiftUI

struct AdaptiveSheetPresentationModifier: ViewModifier {
    var presentation: AdaptiveSheetPresentation

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let halfScreenHeight = screenHeight / 2

            switch presentation {
            case .compact:
                 AnyView(content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .edgesIgnoringSafeArea(.all)
                )
            case .medium:
                 AnyView(content
                    .frame(maxWidth: .infinity, maxHeight: halfScreenHeight)
                    .edgesIgnoringSafeArea(.all) // Adjust this as needed
                )
            case .full:
                 AnyView(content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                )
            }
        }
    }
}


enum AdaptiveSheetPresentation {
    case compact, medium, full
}

extension View {
    func adaptiveSheet(presentation: AdaptiveSheetPresentation) -> some View {
        self.modifier(AdaptiveSheetPresentationModifier(presentation: presentation))
    }
}
