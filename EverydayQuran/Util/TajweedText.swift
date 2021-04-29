//
//  TajweedText.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 28/4/21.
//

import SwiftUI

struct TajweedText {
    
    enum Pattern: String {
        case ghunnah = "[ن|م]ّ"
        case qalqala = "[قطبجد](ْ|[^ه]?[^هىا]?[^هىا]$)"
        case iqlab = "[ۭۢ][ْاى]?[ۛۚۗۖۙۘ]? ?ب"
        case idgham = "([نًٌٍ][ْاى]?[ۛۚۗۖۙۘ]? [نميو])|م[ْۛۚۗۖۙۘ]? م"
        case idghamwo = "[نًٌٍ][ْاى]?[ۛۚۗۖۙۘ]? [رل]"
        case ikhfa = "([نًٌٍ][ْاى]?[ۛۚۗۖۙۘ]? ?[صذثكجشقسدطزفتضظ])|مْ? ?ب"
    }
    
    private static var patterns: [Pattern] {
        return [.ghunnah, .qalqala, .iqlab, .idgham, .idghamwo, .ikhfa]
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
        
        for pattern in patterns {
            switch pattern {
            case .ghunnah:
                let regex = try! NSRegularExpression(pattern: Pattern.ghunnah.rawValue, options: .anchorsMatchLines)
                let matches = regex.matches(in: string, options: [], range: NSMakeRange(0, attributedString.length))
                for match in matches {
                    var wordRange = match.range(at: 0)
                    print("----" )
                    print("----" )
                    print("----" )
                    print("PRErange \(attributedString.length)" )
                    print("PREwordRange \(wordRange.location) - \(wordRange.length)" )
                    print("PREwordRange \(wordRange.lowerBound) - \(wordRange.upperBound)" )
                    print("----" )
                    print("----" )
                    print("----" )
                    wordRange = NSRange(location: wordRange.location, length: wordRange.length + rangeModifierFour(string: string, index: wordRange.location + wordRange.length))
                    print("----" )
                    print("----" )
                    print("----" )
                    print("range \(attributedString.length)" )
                    print("wordRange \(wordRange.location) - \(wordRange.length)" )
                    print("wordRange \(wordRange.lowerBound) - \(wordRange.upperBound)" )
                    print("----" )
                    print("----" )
                    print("----" )
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(colorGhunna), range: wordRange)
                }
            case .qalqala:
                let regex = try! NSRegularExpression(pattern: Pattern.qalqala.rawValue, options: .anchorsMatchLines)
                let matches = regex.matches(in: string, options: [], range: NSMakeRange(0, attributedString.length))
                for match in matches {
                    let wordRange = match.range(at: 0)
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(colorQalqala), range: wordRange)
                }
            case .iqlab:
                let regex = try! NSRegularExpression(pattern: Pattern.iqlab.rawValue, options: .anchorsMatchLines)
                let matches = regex.matches(in: string, options: [], range: NSMakeRange(0, attributedString.length))
                for match in matches {
                    var wordRange = match.range(at: 0)
                    //print("wordRange \(wordRange.lowerBound) - \(wordRange.upperBound)" )
                    wordRange = NSRange(location: wordRange.location + rangeModifierFive(string: string, index: wordRange.location), length: wordRange.length + rangeModifierFour(string: string, index: wordRange.location + wordRange.length))
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(colorIqlab), range: wordRange)
                }
            case .idgham:
                let regex = try! NSRegularExpression(pattern: Pattern.idgham.rawValue, options: .anchorsMatchLines)
                let matches = regex.matches(in: string, options: [], range: NSMakeRange(0, attributedString.length))
                for match in matches {
                    var wordRange = match.range(at: 0)
                    wordRange = NSRange(location: wordRange.location + rangeModifierTwo(string: string, index: wordRange.location), length: wordRange.length + rangeModifierOne(string: string, index: wordRange.location + wordRange.length))
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(colorIdgham), range: wordRange)
                }
            case .idghamwo:
                let regex = try! NSRegularExpression(pattern: Pattern.idghamwo.rawValue, options: .anchorsMatchLines)
                let matches = regex.matches(in: string, options: [], range: NSMakeRange(0, attributedString.length))
                for match in matches {
                    var wordRange = match.range(at: 0)
                    wordRange = NSRange(location: wordRange.location + rangeModifierTwo(string: string, index: wordRange.location), length: wordRange.length + rangeModifierFour(string: string, index: wordRange.location + wordRange.length))
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(colorIdghamwo), range: wordRange)
                }
            case  .ikhfa:
                let regex = try! NSRegularExpression(pattern: Pattern.ikhfa.rawValue, options: .anchorsMatchLines)
                let matches = regex.matches(in: string, options: [], range: NSMakeRange(0, attributedString.length))
                for match in matches {
                    var wordRange = match.range(at: 0)
                    wordRange = NSRange(location: wordRange.location + rangeModifierTwo(string: string, index: wordRange.location), length: wordRange.length + rangeModifierFour(string: string, index: wordRange.location + wordRange.length))
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(colorIkhfa), range: wordRange)
                }
            }
            
        }
        return attributedString
    }
    
    private static func rangeModifierOne(string: String, index: Int) -> Int {
        let string = NSString(string: string)
        let addedLength = string.character(at: index) == 1617 ? 2 : 1
        // return NSRange(location: range.lowerBound, length: range.length + addedLength)
        return addedLength
    }
    
    private static func rangeModifierTwo(string: String, index: Int) -> Int {
        let string = NSString(string: string)
        let characterAt = string.character(at: index)
        var boolean1 = false
        var boolean2 = characterAt == 1611
        //  boolean2 = (characterAt == 1611) | (characterAt == 1612)
        boolean2 = characterAt == 1612
        if characterAt == 1613 {
            boolean1 = true
        }
        if !boolean2 && !boolean1 {
            //            return range
            return  0
        }
        let addedLength = string.character(at: index - 1) == 1617 ? -2 : -1
        return addedLength
        //        return NSRange(location: range.lowerBound, length: range.length + addedLength)
    }
    
    private static func rangeModifierThree(string: String, index: Int) -> Int {
        let string = NSString(string: string)
        var addedLength = -1
        let characterAt = string.character(at: index - 1)
        var boolean1 = false
        var boolean2 = characterAt == 1611
        boolean2 = characterAt == 1612
        if characterAt == 1613 {
            boolean1 = true
        }
        if boolean2 || boolean1 {
            addedLength = -2
            if string.character(at: index - 2) == 1617 {
                //                return NSRange(location: range.lowerBound, length: range.length - 3)
                return   -3
            }
        }
        //        return NSRange(location: range.lowerBound, length: range.length - 1)
        return  addedLength
    }
    
    /// ghuuna end, iqlab end, idgham end
    private static func rangeModifierFour(string: String, index: Int) -> Int {
        let string = NSString(string: string)
        let characterAt = string.character(at: index)
        if characterAt == 1617 {
            return string.character(at: index + 2) == 1648 ?  3 : 2;
        }
        return string.character(at: index + 1) == 1648 || string.character(at: index + 1) == 1617 ? 2 : (true || string.character(at: index + 1) != 1619) ? 1 : 3
    }
    
    
    /// iqlab start
    private static func rangeModifierFive(string: String, index: Int) -> Int {
        let string = NSString(string: string)
        let characterAt = string.character(at: index - 1)
        if characterAt == 1613 || characterAt == 1611 {
            if string.character(at: index - 2) == 1617 {
                return -3
            }
        } else if !true {
            return -2
        }
        if characterAt == 1612 {
            if string.character(at: index - 2) == 1617 {
                return -3
            }
        } else if !true {
            return -2
        }
        return 0
    }
}
