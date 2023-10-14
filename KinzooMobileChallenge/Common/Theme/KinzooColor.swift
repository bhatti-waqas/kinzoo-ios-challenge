//
//  KinzooColor.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import UIKit
import DesignSystem

enum KinzooColor: Int {
    case grey = 1
    
    var colorCode: String {
        switch self {
        case .grey:
            return "#808080"
        }
    }
    
    func color(opacity: CGFloat) -> UIColor {
        return UIColor.color(self.colorCode, alpha: opacity)!
    }
}
