//
//  Settings.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/7/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct Settings {
    private var bRed: Int
    private var bGreen: Int
    private var bBlue: Int
    private var fRed: Int
    private var fGreen: Int
    private var fBlue: Int
    private var hRed: Int
    private var hGreen: Int
    private var hBlue: Int
    
    static private let `default` = Settings(bRed: 0, bGreen: 0, bBlue: 0, fRed: 0, fGreen: 0, fBlue: 0, hRed: 0, hGreen: 0, hBlue: 0)
    static var user: Settings  = {
        if let bRedVal = UserDefaults.standard.object(forKey: "bRed") as? Int,
            let bBlueVal = UserDefaults.standard.object(forKey: "bBlue") as? Int,
            let bGreenVal = UserDefaults.standard.object(forKey: "bGreen") as? Int,
            let fRedVal = UserDefaults.standard.object(forKey: "bRed") as? Int,
            let fBlueVal = UserDefaults.standard.object(forKey: "bBlue") as? Int,
            let fGreenVal = UserDefaults.standard.object(forKey: "bGreen") as? Int,
            let hRedVal = UserDefaults.standard.object(forKey: "bRed") as? Int,
            let hBlueVal = UserDefaults.standard.object(forKey: "bBlue") as? Int,
            let hGreenVal = UserDefaults.standard.object(forKey: "bGreen") as? Int {
            return Settings(bRed: bRedVal, bGreen: bGreenVal, bBlue: bBlueVal, fRed: fRedVal, fGreen: fGreenVal, fBlue: fBlueVal, hRed: hRedVal, hGreen: hGreenVal, hBlue: hBlueVal)
        }
        return Settings.default
    }()
    public func backgroundColor() -> UIColor {
        let red: Double = Double(bRed)
        let green: Double = Double(bGreen)
        let blue: Double = Double(bBlue)
        return UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }
    public func foregroundColor() -> UIColor {
        let red: Double = Double(fRed)
        let green: Double = Double(fGreen)
        let blue: Double = Double(fBlue)
        return UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }
    public func highlightsColor() -> UIColor {
        let red: Double = Double(hRed)
        let green: Double = Double(hGreen)
        let blue: Double = Double(hBlue)
        return UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }
    
    public func setColors(bgColor: UIColor, fgColor: UIColor, hlColor: UIColor) {
        let bRed = Int((bgColor.components.red * 255).rounded())
        let bGreen = Int((bgColor.components.green * 255).rounded())
        let bBlue = Int((bgColor.components.blue * 255).rounded())
        let fRed = Int((fgColor.components.red * 255).rounded())
        let fGreen = Int((fgColor.components.green * 255).rounded())
        let fBlue = Int((fgColor.components.blue * 255).rounded())
        let hRed = Int((hlColor.components.red * 255).rounded())
        let hGreen = Int((hlColor.components.green * 255).rounded())
        let hBlue = Int((hlColor.components.blue * 255).rounded())
        UserDefaults.standard.set(bRed, forKey: "bRed")
        UserDefaults.standard.set(bGreen, forKey: "bGreen")
        UserDefaults.standard.set(bBlue, forKey: "bBlue")
        UserDefaults.standard.set(fRed, forKey: "fRed")
        UserDefaults.standard.set(fGreen, forKey: "fGreen")
        UserDefaults.standard.set(fBlue, forKey: "fBlue")
        UserDefaults.standard.set(hRed, forKey: "hRed")
        UserDefaults.standard.set(hGreen, forKey: "hGreen")
        UserDefaults.standard.set(hBlue, forKey: "hBlue")
    }
}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}

