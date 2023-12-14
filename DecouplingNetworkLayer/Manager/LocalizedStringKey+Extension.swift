import Foundation
import SwiftUI

extension LocalizedStringKey {
    var localized: String {
        NSLocalizedString(String(describing: self), tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
