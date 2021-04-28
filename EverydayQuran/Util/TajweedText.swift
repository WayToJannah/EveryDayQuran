//
//  TajweedText.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 28/4/21.
//

import SwiftUI

struct TajweedText {
    
    private static let ghunnah = "[ن|م]ّ"
    private static let qalqala = "[قطبجد](ْ|[^ه]?[^هىا]?[^هىا]$)"
    private static let iqlab = "[ۭۢ][ْاى]?[ۛۚۗۖۙۘ]? ?ب"
    private static let idgham = "([نًٌٍ][ْاى]?[ۛۚۗۖۙۘ]? [نميو])|م[ْۛۚۗۖۙۘ]? م"
    private static let idghamwo = "[نًٌٍ][ْاى]?[ۛۚۗۖۙۘ]? [رل]"
    private static let ikhfa = "([نًٌٍ][ْاى]?[ۛۚۗۖۙۘ]? ?[صذثكجشقسدطزفتضظ])|مْ? ?ب"
    private static var patterns: [String] {
        return [ghunnah, qalqala, iqlab, idgham, idghamwo, ikhfa]
    }
    
    static let colorGhunna = Color(rgba: 0xd16a00)
    static let colorIdgham = Color(rgba: 0xb955c8)
    static let colorIdghamwo = Color(rgba: 0xaaaaaa)
    static let colorIkhfa = Color(rgba: 0xb60000)
    static let colorIqlab = Color(rgba: 0x3164c5)
    static let colorQalqala = Color(rgba: 0x2f9900)
    
    private static var tajweedColors: [Color] {
        [colorGhunna, colorQalqala, colorIqlab, colorIdgham, colorIdghamwo, colorIkhfa]
    }
    
    static func tajweedTexr(for string: String, isDark: Bool = false) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: string)
        if isDark {
            attributedString.addAttributes([.font: UIFont.preferredFont(forTextStyle: .title3), .foregroundColor: UIColor.white,
                                            .paragraphStyle: {
                                                let paragraph = NSMutableParagraphStyle()
                                                paragraph.lineSpacing = 10
                                                return paragraph
                                            }()], range: NSRange(location: 0, length: attributedString.length))
        } else {
            attributedString.addAttributes([.font: UIFont.preferredFont(forTextStyle: .title3), .foregroundColor: UIColor.black,
                                            .paragraphStyle: {
                                                let paragraph = NSMutableParagraphStyle()
                                                paragraph.lineSpacing = 10
                                                return paragraph
                                            }()], range: NSRange(location: 0, length: attributedString.length))
        }
       
        for i in 0..<patterns.count {
            let regex = try! NSRegularExpression(pattern: patterns[i], options: .anchorsMatchLines)
            let matches = regex.matches(in: string, options: [], range: NSMakeRange(0, attributedString.length))
            for match in matches {
                let wordRange = match.range(at: 0)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(tajweedColors[i]), range: wordRange)
            }
        }
        return attributedString
    }
}

//let string = " الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ"
//var attributedString = NSMutableAttributedString(string: string)
//
//let stringOneRegex = try NSRegularExpression(pattern: "([نًٌٍ][ْاى]?[ۛۚۗۖۙۘ]? [نميو])|م[ْۛۚۗۖۙۘ]? م", options: .anchorsMatchLines)
//let stringOneMatches = stringOneRegex.matches(in: string, options: [], range: NSMakeRange(0, attributedString.length))
//for stringOneMatch in stringOneMatches {
//    let wordRange = stringOneMatch.range(at: 0)
//    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: wordRange)
//}
//
//textView.attributedText = attributedString
