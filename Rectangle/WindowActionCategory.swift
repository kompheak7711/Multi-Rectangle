/// WindowActionCategory.swift

import Foundation

enum WindowActionCategory {

    case halves, corners, thirds, max, size, display, move, other, sixths, fourths, fifths, eighths, ninths, twelfths, sixteenths, tiling

    var menuOrder: Int {
        switch self {
        case .size: return 0
        case .move: return 1
        case .thirds: return 2
        case .fourths: return 3
        case .fifths: return 4
        case .sixths: return 5
        case .eighths: return 6
        case .ninths: return 7
        case .twelfths: return 8
        case .sixteenths: return 9
        case .tiling: return 10
        default: return 99
        }
    }

    var displayName: String {
        switch self {
        case .halves:
            return NSLocalizedString("Sides", tableName: "Main", value: "", comment: "")
        case .corners:
            return NSLocalizedString("Corners", tableName: "Main", value: "", comment: "")
        case .thirds:
            return NSLocalizedString("Thirds", tableName: "Main", value: "", comment: "")
        case .max:
            return NSLocalizedString("Maximize", tableName: "Main", value: "", comment: "")
        case .size:
            return NSLocalizedString("Size", tableName: "Main", value: "", comment: "")
        case .display:
            return NSLocalizedString("Display", tableName: "Main", value: "", comment: "")
        case .other:
            return NSLocalizedString("Other", tableName: "Main", value: "", comment: "")
        case .move:
            return NSLocalizedString("Move to Edge", tableName: "Main", value: "", comment: "")
        case .fourths:
            return NSLocalizedString("Fourths", tableName: "Main", value: "", comment: "")
        case .fifths:
            return NSLocalizedString("Fifths", tableName: "Main", value: "Fifths", comment: "")
        case .sixths:
            return NSLocalizedString("Sixths", tableName: "Main", value: "", comment: "")
        case .eighths:
            return NSLocalizedString("Eighths", tableName: "Main", value: "", comment: "")
        case .ninths:
            return NSLocalizedString("Ninths", tableName: "Main", value: "Ninths", comment: "")
        case .twelfths:
            return NSLocalizedString("Twelfths", tableName: "Main", value: "Twelfths", comment: "")
        case .sixteenths:
            return NSLocalizedString("Sixteenths", tableName: "Main", value: "Sixteenths", comment: "")
        case .tiling:
            return NSLocalizedString("Tiling", tableName: "Main", value: "Tiling", comment: "")
        }
    }
}
