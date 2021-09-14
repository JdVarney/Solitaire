//
//  Card.swift
//  Klondike
//
//  Created by John Varney on 5/7/21.
//

import Foundation
import UIKit

public struct Card: Klondike, CustomStringConvertible, Identifiable {
    public var description: String
    public var id = UUID()
    public var faceShowing = false
    public var encumbered = true
    
    private(set) var rank: Rank
    private(set) var suit: Suit
    private(set) var color: CardColor
    private(set) var hashCalc: Int
    private(set) var suitIcon: SuitIcon
    public var cardImage: UIImage

    public init(rank:Rank, suit:Suit, color:CardColor, suitIcon: SuitIcon) {
        self.rank = rank
        switch rank {
            case .ace: description = "1"
            case .two: description = "2"
            case .three: description = "3"
            case .four: description = "4"
            case .five: description = "5"
            case .six: description = "6"
            case .seven: description = "7"
            case .eight: description = "8"
            case .nine: description = "9"
            case .ten: description = "10"
            case .jack: description =  "11"
            case .queen: description = "12"
            case .king: description = "13"
        }
        self.suitIcon = suitIcon
        self.description += suitIcon.rawValue

        self.suit = suit
        self.color = color
        
        hashCalc = self.rank.rawValue +
            self.suit.rawValue * 10 +
            self.color.rawValue * 100
                
        self.cardImage = UIImage.init(imageLiteralResourceName:
                                    suit.simpleDescription() +
                                    rank.simpleDescription())
    }
    
    public func toString() -> Void {
        print("\(self.color) \(self.description)")
        return
    }
    
    public static func compare (lhs: Card, rhs:Card) -> Bool {
        switch lhs.color {
        case .red : return rhs.color == .black &&
            lhs.rank.rawValue == rhs.rank.rawValue + 1
        default: return rhs.color == .red &&
            lhs.rank.rawValue == rhs.rank.rawValue + 1
        }
    }
}

public protocol Klondike {
    static func compare (lhs: Card, rhs: Card) -> Bool
}

extension Card: Hashable, Equatable {
    public static func == (lhs: Card, rhs:Card) -> Bool {
        return lhs.hashCalc == rhs.hashCalc
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashCalc)
    }
}
