//
//  TajweedHtmlText.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 29/4/21.
//

import SwiftUI

struct TajweedHtmlText {
    
    static let style = "body { text-align:left; }"
    static let tajweedCSS = "tajweed { cursor: pointer; } tajweed.ham_wasl, tajweed.slnt, tajweed.laam_shamsiyah { color: #aaa; } tajweed.ham_wasl:hover, tajweed.slnt:hover, tajweed.laam_shamsiyah:hover { background-color: #d7d7d7; } tajweed.madda_normal { color: #537fff; } tajweed.madda_permissible { color: #4050ff; } tajweed.madda_necessary { color: #000ebc; } tajweed.madda_obligatory { color: #2144c1; } tajweed.qalaqah { color: #dd0008; } tajweed.qalaqah:hover { background-color: #f3a6a9; color: #dd0008; } tajweed.ikhafa_shafawi { color: #d500b7; } tajweed.ikhafa_shafawi:hover { background-color: #f0a6e6; color: #d500b7; } tajweed.ikhafa { color: #9400a8; } tajweed.ikhafa:hover { background-color: #daa6e1; color: #9400a8; } tajweed.iqlab { color: #26bffd; } tajweed.iqlab:hover { background-color: #92e5ff; color: #0099c5; } tajweed.idgham_shafawi { color: #58b800; } tajweed.idgham_shafawi:hover { background-color: #bae890; color: #58b800; } tajweed.idgham_ghunnah { color: #169200; } tajweed.idgham_ghunnah:hover { background-color: #9ce58e; color: #169200; } tajweed.idgham_wo_ghunnah { color: #169200; } tajweed.idgham_wo_ghunnah:hover { background-color: #9ce58e; color: #169200; } tajweed.idgham_mutajanisayn, tajweed.idgham_mutaqaribayn { color: #a1a1a1; } tajweed.idgham_mutajanisayn:hover, tajweed.idgham_mutaqaribayn:hover { background-color: #d7d7d7; } tajweed.ghunnah { color: #ff7e1e; } tajweed.ghunnah:hover { background-color: #ff7e1e; color: black; }"
    
    
    static func tajweedTextOnFinish(for string: String, isDark: Bool = false, onFinish: @escaping (NSMutableAttributedString) -> ()) {
        DispatchQueue.main.async {
            let string = "<html><head><meta charset=\"utf-8\"><style> \(style) \(TajweedHtmlText.tajweedCSS) </style></head><body> \(string) </body></html>"
            if let attributedString = try? NSMutableAttributedString(data:  Data(string.utf8), options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
               // .font: UIFont.preferredFont(forTextStyle: .title3)
                attributedString.addAttributes([
                                                .font: AmiriBold.amiriBold(fontSize: 20)!,
                                                .paragraphStyle: {
                                                    let paragraph = NSMutableParagraphStyle()
                                                    paragraph.alignment = .right
                                                    paragraph.lineSpacing = 10
                                                    return paragraph
                                                }()], range: NSRange(location: 0, length: attributedString.length))
                onFinish(attributedString)
            } else {
                onFinish(NSMutableAttributedString())
            }
            
        }
    }
}

