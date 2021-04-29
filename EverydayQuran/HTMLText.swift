//
//  HTMLText.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 29/4/21.
//

import SwiftUI

struct HTMLLabel: UIViewRepresentable {
    
    let html: String
    
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UILabel {
        let label = UILabel()
        DispatchQueue.main.async {
            label.attributedText = self.html.convertHtml()
        }
        
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<Self>) {}
    
}

