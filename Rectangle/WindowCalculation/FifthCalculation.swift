/// FifthCalculation.swift

import Foundation

class FifthCalculation: WindowCalculation, OrientationAware {

    private let baseOrdinal: Int

    init(ordinal: Int) {
        baseOrdinal = ordinal
    }

    override func calculateRect(_ params: RectCalculationParameters) -> RectResult {
        let ordinal = resolvedOrdinal(params)
        if ordinal == baseOrdinal {
            return orientationBasedRect(params.visibleFrameOfScreen)
        }
        return FifthCalculation(ordinal: ordinal).orientationBasedRect(params.visibleFrameOfScreen)
    }

    func landscapeRect(_ visibleFrameOfScreen: CGRect) -> RectResult {
        let left = floor(visibleFrameOfScreen.width * CGFloat(baseOrdinal) / 5.0)
        let right = floor(visibleFrameOfScreen.width * CGFloat(baseOrdinal + 1) / 5.0)
        let rect = CGRect(x: visibleFrameOfScreen.minX + left,
                          y: visibleFrameOfScreen.minY,
                          width: right - left,
                          height: visibleFrameOfScreen.height)
        return RectResult(rect, subAction: landscapeSubAction)
    }

    func portraitRect(_ visibleFrameOfScreen: CGRect) -> RectResult {
        let topOffset = floor(visibleFrameOfScreen.height * CGFloat(baseOrdinal) / 5.0)
        let bottomOffset = floor(visibleFrameOfScreen.height * CGFloat(baseOrdinal + 1) / 5.0)
        let rect = CGRect(x: visibleFrameOfScreen.minX,
                          y: visibleFrameOfScreen.maxY - bottomOffset,
                          width: visibleFrameOfScreen.width,
                          height: bottomOffset - topOffset)
        return RectResult(rect, subAction: portraitSubAction)
    }

    private func resolvedOrdinal(_ params: RectCalculationParameters) -> Int {
        guard Defaults.subsequentExecutionMode.value != .none,
              let lastAction = params.lastAction,
              lastAction.action == params.action,
              let previousOrdinal = lastAction.subAction?.fifthOrdinal
        else {
            return baseOrdinal
        }

        switch params.action {
        case .firstFifth:
            return (previousOrdinal + 1) % 5
        case .lastFifth:
            return (previousOrdinal + 4) % 5
        default:
            return baseOrdinal
        }
    }

    private var landscapeSubAction: SubWindowAction {
        switch baseOrdinal {
        case 0: return .firstFifthLandscape
        case 1: return .secondFifthLandscape
        case 2: return .thirdFifthLandscape
        case 3: return .fourthFifthLandscape
        default: return .lastFifthLandscape
        }
    }

    private var portraitSubAction: SubWindowAction {
        switch baseOrdinal {
        case 0: return .firstFifthPortrait
        case 1: return .secondFifthPortrait
        case 2: return .thirdFifthPortrait
        case 3: return .fourthFifthPortrait
        default: return .lastFifthPortrait
        }
    }
}

private extension SubWindowAction {
    var fifthOrdinal: Int? {
        switch self {
        case .firstFifthLandscape, .firstFifthPortrait: return 0
        case .secondFifthLandscape, .secondFifthPortrait: return 1
        case .thirdFifthLandscape, .thirdFifthPortrait: return 2
        case .fourthFifthLandscape, .fourthFifthPortrait: return 3
        case .lastFifthLandscape, .lastFifthPortrait: return 4
        default: return nil
        }
    }
}
