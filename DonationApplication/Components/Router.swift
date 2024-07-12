//
//  Router.swift
//  DonationApplication
//
//  Created by Nino Godziashvili on 12.07.24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var currentRoute: Route? = .login
    
     func navigate(to route: Route) {
        currentRoute = route
    }
    
     func isRouteActive(_ route: Route) -> Bool {
        return currentRoute == route
    }
}

enum Route: Hashable {
    case login
    case forgotPassword
    case feedbackPage
    case donorsMainList
}
