//
//  SelectableColors.swift
//  ScrollingColorPicker
//
//  Created by Richard Stockdale on 07/12/2020.
//

import Foundation
import UIKit

struct SelectableColors {
    
    static var colors: [UIColor] {
        return [
            colorFromRgb(r: 236, g: 86, b: 93),
            colorFromRgb(r: 251, g: 113, b: 82),
            colorFromRgb(r: 242, g: 149, b: 59),
            colorFromRgb(r: 226, g: 183, b: 0),
            colorFromRgb(r: 41, g: 184, b: 74),
            colorFromRgb(r: 0, g: 190, b: 155),
            colorFromRgb(r: 0, g: 188, b: 209),
            colorFromRgb(r: 0, g: 162, b: 237),
            colorFromRgb(r: 53, g: 80, b: 174),
            colorFromRgb(r: 112, g: 68, b: 169),
            colorFromRgb(r: 164, g: 99, b: 210),
            colorFromRgb(r: 230, g: 11, b: 191),
            colorFromRgb(r: 117, g: 128, b: 138),
            colorFromRgb(r: 127, g: 140, b: 128),
            colorFromRgb(r: 135, g: 122, b: 118)
        ]
    }
    
    private static func colorFromRgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
