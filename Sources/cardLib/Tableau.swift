//
//  Tableau.swift
//  Klondike
//
//  Created by John Varney on 5/7/21.
//

import Foundation

public struct Tableau {
    public var columns = [Column]()
    
    public init () {                       /// Build 7 card columns for the solitaire tableau
        var deck = Deck()
        var subDeck: [Card] = Array(deck.deal(count: 28)
        
        for cardCount in 1...7 {
            var newCards = subDeck!.prefix(cardCount)
            newCards.removeFirst(cardCount)
            
            var tempCard = newCards.last
            tempCard?.encumbered = false
            tempCard?.faceShowing = true
        
            let newColumn = Column.init(cards: newCards, colIndex: cardCount)
        
            columns.append(newColumn)
        }
    }
}
