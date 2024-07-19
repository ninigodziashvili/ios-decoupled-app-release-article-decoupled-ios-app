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
    private var history: [Route] = []
    
    func navigate(to route: Route) {
           if let currentRoute = currentRoute {
               history.append(currentRoute)
           }
           currentRoute = route
       }

       func isRouteActive(_ route: Route) -> Bool {
           return currentRoute == route
       }

       func pop() {
           currentRoute = history.popLast()
       }
   }

enum Route: Hashable {
    case login
    case forgotPassword
    case feedbackPage
    case donorsMainList
}
