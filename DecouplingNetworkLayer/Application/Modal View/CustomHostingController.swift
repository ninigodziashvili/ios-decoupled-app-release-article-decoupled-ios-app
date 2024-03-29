//
//  CustomHostingController.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 29.03.24.
//

import Foundation
import SwiftUI

class CustomHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        if let presentationController = presentationController as?
            UISheetPresentationController
        {
            presentationController.detents = [
                .medium()
            ]
            presentationController.prefersGrabberVisible = true
        }
    }
}
