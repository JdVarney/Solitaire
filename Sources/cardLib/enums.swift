//
//  enums.swift
//  Klondike
//
//  Created by John Varney on 5/7/21.
//

import Foundation

public enum Rank: Int, CaseIterable {
    case ace = 1, two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7,
         eight = 8, nine = 9, ten = 10, jack = 11, queen = 12, king = 13
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "10"
        case .jack:
            return "11"
        case .queen:
            return "12"
        case .king:
            return "13"
        }
    }
}

public enum Suit: Int, CaseIterable {
    case hearts = 1, clubs = 2, diamonds = 3, spades = 4
    
    func simpleDescription() -> String {
            switch self {
            case .spades:
                return "Spades"
            case .hearts:
                return "Hearts"
            case .diamonds:
                return "Diamonds"
            case .clubs:
                return "Clubs"
            }
        }
}

public enum SuitIcon: String {
    case hearts = "♥︎" , clubs = "♣︎", diamonds = "♦︎", spades = "♠︎"
}

public enum CardColor: Int, CaseIterable {
    case red = 1 , black = 2
}
