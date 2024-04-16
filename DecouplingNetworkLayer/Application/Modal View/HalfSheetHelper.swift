//
//  HalfSheetHelper.swift
//  DecouplingNetworkLayer
//
//  Created by Nino Godziashvili on 29.03.24.
//

import Foundation
import SwiftUI

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var modalHeight: CGFloat // Custom modal height
    
    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet {
            let sheetController = UIHostingController(rootView: sheetView)
            sheetController.modalPresentationStyle = .overCurrentContext
            uiViewController.present(sheetController, animated: true, completion: nil)
            
            // Adjust the frame of the presented view controller
            if let presentationController = sheetController.presentationController {
                let screenSize = UIScreen.main.bounds.size
                sheetController.view.frame = CGRect(x: 0, y: screenSize.height - modalHeight, width: screenSize.width, height: modalHeight)
                presentationController.delegate = context.coordinator
            }
        } else {
            uiViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIAdaptivePresentationControllerDelegate {
        var parent: HalfSheetHelper
        
        init(_ parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            self.parent.showSheet = false
        }
    }
}
