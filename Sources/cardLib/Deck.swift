//
//  Deck.swift
//  Klondike
//
//  Created by John Varney on 5/7/21.
//

import Foundation

public struct Deck {
    private var cards = [Card]()
    private var itemColor = CardColor.black
    private var icon = SuitIcon.clubs
    
    public init () {                        // Create the cards of a deck
        for itemRank in Rank.allCases {
            for itemSuit in Suit.allCases {
                
                switch itemSuit {
                case .diamonds:
                    itemColor = .red
                    self.icon = SuitIcon.diamonds
                case .hearts:
                    itemColor = .red
                    self.icon = SuitIcon.hearts
                case .spades:
                    itemColor = .black
                    self.icon = SuitIcon.spades
                case .clubs:
                    itemColor = .black
                    self.icon = SuitIcon.clubs
                }
                
                let newCard = Card.init(
                    rank: itemRank,
                    suit: itemSuit,
                    color: itemColor,
                    suitIcon: icon
                    )
                
                debugPrint("Deck: " + newCard.description)
                
                cards.append(newCard)
            }
        }
        cards.shuffle()
    return
    }
        
    public mutating func deal(count:Int) -> [Card] {
         guard count <= cards.count else {
            debugPrint("Sufficient Cards are not avaialble for deal: \(count).")
            return []
        }
        
        let newHand = Array(cards.prefix(count))
        
        return newHand
    }
}
