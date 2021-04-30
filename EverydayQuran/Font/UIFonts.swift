//
//  UIFonts.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 30/4/21.
//

import UIKit

public final class AmiriBold {
    public static let large = loadFont(name: fontName,
                                       size: 30.0)
    public static let medium = loadFont(name: fontName,
                                        size: 25.0)
    public static let small = loadFont(name: fontName,
                                       size: 14.0)
    public static func amiriBold(fontSize: CGFloat) -> UIFont? {
        loadFont(name: fontName, size: fontSize)
    }
    
    private static let fontName = "Amiri-Bold"
    
    private static func loadFont(name: String,
                                 size: CGFloat) -> UIFont? {
        if let font = UIFont(name: name, size: size) {
            return font }
        let bundle = Bundle(for: AmiriBold.self)
        
        guard
            let url = bundle.url(forResource: name,
                                 withExtension: "ttf"),
            let fontData = NSData(contentsOf: url),
            let provider = CGDataProvider(data: fontData),
            let cgFont = CGFont(provider),
            let fontName = cgFont.postScriptName as String? else {
            preconditionFailure("Unable to load font named \(name)")
        }
        return UIFont(name: fontName, size: size)
    }
    static let attrs = [
        // NSAttributedString.Key.foregroundColor: UIColor.red,
        NSAttributedString.Key.font: UIFont(name: fontName, size: 24)!
    ]
}

public final class GenericArabicFont {
    
    static func loadFont(arabicFont: ArabicFont,
                                 size: CGFloat) -> UIFont? {
        if let font = UIFont(name: arabicFont.rawValue, size: size) {
            return font }
        let bundle = Bundle(for: AmiriBold.self)
        
        guard
            let url = bundle.url(forResource: arabicFont.rawValue,
                                 withExtension: "ttf"),
            let fontData = NSData(contentsOf: url),
            let provider = CGDataProvider(data: fontData),
            let cgFont = CGFont(provider),
            let fontName = cgFont.postScriptName as String? else {
            preconditionFailure("Unable to load font named \(arabicFont.rawValue)")
        }
        return UIFont(name: fontName, size: size)
    }
    
}


enum ArabicFont: String {
    case amiriRegular = "Amiri-Regular"
    case amiriBold = "Amiri-Bold"
}
