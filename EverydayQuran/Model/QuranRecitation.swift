//
//  QuranRecitation.swift
//  EverydayQuran
//
//  Created by Shahriar Nasim Nafi on 30/4/21.
//

import SwiftUI

enum QuranReciter: Int {
    case abdulBaset = 1
    case alafasy
    case husary
    case minshawi
    case rifai
    case shatri
    case shuraym
    case sudais
    
    /// Name of the `QuranReciter`
    var name: String{
        switch self {
        case .abdulBaset:
            return "AbdulBaset"
        case .alafasy:
            return "Alafasy"
        case .husary:
            return "Husary"
        case .minshawi:
            return "Minshawi"
        case .rifai:
            return "Rifai"
        case .shatri:
            return "Shatri"
        case .shuraym:
            return "Shuraym"
        case .sudais:
            return "Sudais"
        
        }
    }
    
    static let quranBaseURL = "https://verses.quran.com/"
    
     static func verserURL(quranReciter: QuranReciter = .alafasy, recitationStyle: RecitationStyle = .none) -> URL {
        switch quranReciter {
        case .abdulBaset:
            switch recitationStyle {
            case .mujawwad:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.abdulBasetMujawwad.url)")!
            case .murattal:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.abdulBasetMurattal.url)")!
            default:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.abdulBasetMujawwad.url)")!
            }
        case .alafasy:
            return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.alafasy.url)")!
        case .husary:
            switch recitationStyle {
            case .mujawwad:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.husaryMujawwad.url)")!
            case .murattal:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.husaryMurattal.url)")!
            default:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.husaryMujawwad.url)")!
            }
        case .minshawi:
            switch recitationStyle {
            case .mujawwad:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.minshawiMujawwad.url)")!
            case .murattal:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.minshawiMurattal.url)")!
            default:
                return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.minshawiMujawwad.url)")!
            }
        case .rifai:
            return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.rifai.url)")!
        case .shatri:
            return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.shatri.url)")!
        case .shuraym:
            return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.shuraym.url)")!
        case .sudais:
            return URL(string: "\(QuranReciter.quranBaseURL)\(QuranRecitationURL.sudais.url)")!
        
        }
    }
}

enum RecitationStyle: Int {
    case mujawwad = 1
    case murattal
    case none
    
    /// Name of the `RecitationStyle`
    var name: String {
        switch self {
        case .mujawwad:
            return "Mujawwad"
        case .murattal:
            return "Murattal"
        case .none:
            return ""
        }
    }
}


enum QuranRecitationURL: String {
    case abdulBasetMujawwad = "AbdulBaset/Mujawwad/mp3/"
    case abdulBasetMurattal = "AbdulBaset/Murattal/mp3/"
    case alafasy = "Alafasy/mp3/"
    case husaryMujawwad = "Husary/Mujawwad/ogg/"
    case husaryMurattal = "Husary/Murattal/ogg/"
    case minshawiMujawwad = "Minshawi/Mujawwad/mp3/"
    case minshawiMurattal = "Minshawi/Murattal/mp3/"
    case rifai = "Rifai/mp3/"
    case shatri = "Shatri/mp3/"
    case shuraym = "Shuraym/mp3/"
    case sudais = "Sudais/mp3/"
    
    /// partial url
    var url: String {
        self.rawValue
    }
    
}
