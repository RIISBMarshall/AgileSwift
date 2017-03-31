//
//  HoroscopeData.swift
//  Horoscope
//
//  Created by User on 9/25/16.
//  Copyright © 2016 RIIS. All rights reserved.
//


struct Horoscope {
    var name: String
    var description: String
    var symbol: String
    var month: String
}

struct HoroscopeData {
    
    static let horoscopes = [
        Horoscope(name: "Aries",
                  description: "Courageous and Energetic.",
                  symbol: "Ram",
                  month: "April"),
        Horoscope(name: "Taurus",description: "Known for being reliable, practical, ambitious and sensual.", symbol: "Bull", month: "May"),
        Horoscope(name: "Gemini",description: "Gemini-born are clever and intellectual.", symbol: "Twins", month: "June"),
        Horoscope(name: "Cancer",description: "Tenacious, loyal and sympathetic.", symbol: "Crab", month: "July"),
        Horoscope(name: "Leo",description: "Warm, action-oriented and driven by the desire to be loved and admired.", symbol: "Lion", month: "August"),
        Horoscope(name: "Virgo",description: "Methodical, meticulous, analytical and mentally astute.", symbol: "Virgin", month: "September"),
        Horoscope(name: "Libra",description: "Librans are famous for maintaining balance and harmony.", symbol: "Scales",month: "October"),
        Horoscope(name: "Scorpio",description: "Strong willed and mysterious.", symbol: "Scorpion", month: "November"),
        Horoscope(name: "Sagittarius",description: "Born adventurers.", symbol: "Archer", month: "December"),
        Horoscope(name: "Capricorn",description: "The most determined sign in the Zodiac.", symbol: "Goat", month: "January"),
        Horoscope(name: "Aquarius",description: "Humanitarians to the core", symbol: "Water Bearer", month: "February"),
        Horoscope(name: "Pisces",description: "Proverbial dreamers of the Zodiac.", symbol: "Fish", month: "March")
    ]
}
