//
//  ErrorMessage.swift
//  DonationApplication
//
//  Created by Nino Godziashvili on 26.06.24.
//

import Foundation

struct ErrorMessage: Identifiable {
    var id = UUID()
    var title: String
    var message: String
}
