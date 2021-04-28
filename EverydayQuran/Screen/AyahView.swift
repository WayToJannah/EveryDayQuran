//
//  AyahView.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 27/4/21.
//

import SwiftUI
import AttributedText

struct AyahView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var ayahNumber: String = "1"
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                header
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color("StartGradient"))
                        .frame(width: 32, height: 32)
                        Text(ayahNumber) .font(.custom("PoppinsSemiBold", size: 13, relativeTo: .footnote))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {}, label: {
                        Image("ShareAyah")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    Button(action: {}, label: {
                        Image("PlayAyah")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                    Button(action: {}, label: {
                        Image("BookmarkAyah")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                   
                    
                    
                }
            }
            .padding(.bottom, 10)
            HStack {
                Spacer()
                
                if colorScheme == .dark {
                    AttributedText(TajweedText.tajweedTexr(for: "۞ قُلْ أَؤُنَبِّئُكُم بِخَيْرٍۢ مِّن ذَٰلِكُمْ ۚ لِلَّذِينَ ٱتَّقَوْا۟ عِندَ رَبِّهِمْ جَنَّـٰتٌۭ تَجْرِى مِن تَحْتِهَا ٱلْأَنْهَـٰرُ خَـٰلِدِينَ فِيهَا وَأَزْوَٰجٌۭ مُّطَهَّرَةٌۭ وَرِضْوَٰنٌۭ مِّنَ ٱللَّهِ ۗ وَٱللَّهُ بَصِيرٌۢ بِٱلْعِبَادِ", isDark: true))
                    .foregroundColor(.white)
                } else {
                    AttributedText(TajweedText.tajweedTexr(for: "۞ قُلْ أَؤُنَبِّئُكُم بِخَيْرٍۢ مِّن ذَٰلِكُمْ ۚ لِلَّذِينَ ٱتَّقَوْا۟ عِندَ رَبِّهِمْ جَنَّـٰتٌۭ تَجْرِى مِن تَحْتِهَا ٱلْأَنْهَـٰرُ خَـٰلِدِينَ فِيهَا وَأَزْوَٰجٌۭ مُّطَهَّرَةٌۭ وَرِضْوَٰنٌۭ مِّنَ ٱللَّهِ ۗ وَٱللَّهُ بَصِيرٌۢ بِٱلْعِبَادِ"))
                        .foregroundColor(.black)
                }
                        
                       
                
                   
                    
            }
            Text("Say: \"Shall I tell you of (things) even better? With the Lord are gardens with running streams of water for those who keep from evil and follow the straight path, where they will live unchanged with the purest of companions and blessings of God.\" And under God's eyes are devotees")
                .font(.custom("PoppinsSemiBold", size: 17, relativeTo: .headline))
                .fixedSize(horizontal: false, vertical: true)
                  
        }
        .padding()
        
       
    }
    var header: some View {
       Rectangle()
        .frame(height: 50)
        .foregroundColor(Color("AyahHeader"))
    }
}

struct AyahView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AyahView()
            AyahView()
                .preferredColorScheme(.dark)
                
                
                
           
        }
    }
}
