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
    @State var attributedString: NSMutableAttributedString = NSMutableAttributedString(string: "")
    @State var done = false
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
                
//                if colorScheme == .dark {
//                    AttributedText(TajweedText.tajweedTexr(for: "۞ قُلْ أَؤُنَبِّئُكُم بِخَيْرٍۢ مِّن ذَٰلِكُمْ ۚ لِلَّذِينَ ٱتَّقَوْا۟ عِندَ رَبِّهِمْ جَنَّـٰتٌۭ تَجْرِى مِن تَحْتِهَا ٱلْأَنْهَـٰرُ خَـٰلِدِينَ فِيهَا وَأَزْوَٰجٌۭ مُّطَهَّرَةٌۭ وَرِضْوَٰنٌۭ مِّنَ ٱللَّهِ ۗ وَٱللَّهُ بَصِيرٌۢ بِٱلْعِبَادِ", isDark: true))
//                    .foregroundColor(.white)
//                } else {
//                    AttributedText(TajweedText.tajweedTexr(for: "۞ قُلْ أَؤُنَبِّئُكُم بِخَيْرٍۢ مِّن ذَٰلِكُمْ ۚ لِلَّذِينَ ٱتَّقَوْا۟ عِندَ رَبِّهِمْ جَنَّـٰتٌۭ تَجْرِى مِن تَحْتِهَا ٱلْأَنْهَـٰرُ خَـٰلِدِينَ فِيهَا وَأَزْوَٰجٌۭ مُّطَهَّرَةٌۭ وَرِضْوَٰنٌۭ مِّنَ ٱللَّهِ ۗ وَٱللَّهُ بَصِيرٌۢ بِٱلْعِبَادِ"))
//                        .foregroundColor(.black)
//                }
               
                        
//                HTMLLabel(html: )
                AttributedText(attributedString)
             }
            Text("Say: \"Shall I tell you of (things) even better? With the Lord are gardens with running streams of water for those who keep from evil and follow the straight path, where they will live unchanged with the purest of companions and blessings of God.\" And under God's eyes are devotees")
                .font(.custom("PoppinsSemiBold", size: 17, relativeTo: .headline))
                .fixedSize(horizontal: false, vertical: true)
                  
        }
        .padding()
        .onAppear {
        
            ayahText(string: "۞ قُلْ أَؤُنَبِّئُك<tajweed class=ikhafa_shafawi>ُم ب</tajweed>ِخَيْ<tajweed class=idgham_ghunnah>رٍ م</tajweed>ِّ<tajweed class=ikhafa>ن ذ</tajweed><tajweed class=madda_normal>َٲ</tajweed>لِكُمْ‌ۚ لِلَّذِينَ <tajweed class=ham_wasl>ٱ</tajweed>تَّقَوْ<tajweed class=slnt>اْ</tajweed> عِ<tajweed class=ikhafa>ند</tajweed>َ رَبِّهِمْ جَ<tajweed class=ghunnah>نّ</tajweed>َ<tajweed class=madda_normal>ـٰ</tajweed><tajweed class=ikhafa>تٌ ت</tajweed>َ<tajweed class=qalaqah>جْ</tajweed>رِى مِ<tajweed class=ikhafa>ن ت</tajweed>َحْتِهَا <tajweed class=ham_wasl>ٱ</tajweed>لْأَنْهَ<tajweed class=madda_normal>ـٰ</tajweed>رُ خَ<tajweed class=madda_normal>ـٰ</tajweed>لِدِينَ فِيهَا وَأَزْو<tajweed class=madda_normal>َٲ</tajweed><tajweed class=idgham_ghunnah>جٌ م</tajweed>ُّطَهَّرَ<tajweed class=idgham_ghunnah>ةٌ و</tajweed>َرِضْو<tajweed class=madda_normal>َٲ</tajweed><tajweed class=idgham_ghunnah>نٌ م</tajweed>ِّنَ <tajweed class=ham_wasl>ٱ</tajweed>للَّهِ‌ۗ وَ<tajweed class=ham_wasl>ٱ</tajweed>للَّهُ بَصِي<tajweed class=iqlab>رُۢ ب</tajweed>ِ<tajweed class=ham_wasl>ٱ</tajweed>لْعِب<tajweed class=madda_permissible>َا</tajweed><tajweed class=qalaqah>د</tajweed>ِ <span class=end>١٥</span>")
             
          }
        
       
    }
    var header: some View {
       Rectangle()
        .frame(height: 50)
        .foregroundColor(Color("AyahHeader"))
    }
  
    
    func ayahText(string: String) {
            TajweedHtmlText.tajweedTextOnFinish(for: string, isDark: false) { (string) in
                attributedString = string
             
            }
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
