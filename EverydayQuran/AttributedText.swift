//
//  AttributedText.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 28/4/21.
//

import SwiftUI


struct TextWithAttributedString: View {
    
    var attributedText: NSAttributedString
    @State private var height: CGFloat = .zero
    
    
    
    
    var body: some View {
        InternalTextView(attributedText: attributedText, dynamicHeight: $height)
            .frame(minHeight: height)
    }
    
    struct InternalTextView: UIViewRepresentable {
        
        var attributedText: NSAttributedString
        @Binding var dynamicHeight: CGFloat
        
        func makeUIView(context: Context) -> UITextView {
//            let textViewAttributes: [NSAttributedString.Key:Any] = [
//                .font: UIFont.systemFont(ofSize: 17, weight: .medium),
//                .foregroundColor: UIColor.black,
//                .paragraphStyle: {
//                    let paragraph = NSMutableParagraphStyle()
//                    paragraph.lineSpacing = 4
//                    return paragraph
//                }()]
            let textView = UITextView()
            textView.delegate = context.coordinator
            textView.textAlignment = .natural
            textView.isScrollEnabled = false
            textView.isUserInteractionEnabled = false
            textView.showsVerticalScrollIndicator = false
            textView.showsHorizontalScrollIndicator = false
            textView.allowsEditingTextAttributes = false
            textView.isEditable = false
            textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            textView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
            return textView
            
            
        }
        
        func updateUIView(_ uiView: UITextView, context: Context) {
            uiView.attributedText = attributedText
            DispatchQueue.main.async {
                dynamicHeight = uiView.sizeThatFits(CGSize(width: uiView.bounds.width, height: CGFloat.greatestFiniteMagnitude)).height
            }
        }
        
        func makeCoordinator() -> DelegateTextView {
            DelegateTextView()
        }
    }
    
    
    
}

class DelegateTextView: NSObject, UITextViewDelegate {
    
}
