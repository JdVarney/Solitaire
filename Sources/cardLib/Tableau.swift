//
//  Tableau.swift
//  Klondike
//
//  Created by John Varney on 5/7/21.
//

import Foundation

public struct Tableau {
    public var columns = [Column]()
    public var draw = Draw()
    private var deck = Deck()

    public init () {             // Build 7 card columns for the solitaire tableau
        
        var subDeck: [Card] = Array(deck.deal(count: 28))
        
        for cardCount in 1...7 {
            var newCards = subDeck.prefix(cardCount)
            newCards[cardCount - 1].faceShowing = true
            subDeck.removeFirst(cardCount)
            
            let newColumn = Column.init(cards: Array(newCards), colIndex: cardCount)
            columns.append(newColumn)
        }
        
        draw.cards = Array(deck.deal(count:24)) //Remaining cards go into draw pile
    }
}
