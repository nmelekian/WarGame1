//
//  Card.swift
//  War2
//
//  Created by Nick Melekian on 11/9/23.
//

import Foundation


struct Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        //lhs: Left Hand Side      rhs: Right Hand Side
        return lhs.value.rawValue < rhs.value.rawValue
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        //lhs: Left Hand Side      rhs: Right Hand Side
        return lhs.value.rawValue > rhs.value.rawValue
    }
    
    let value: Value
    let suit: Suit
}


enum Value: Int, CaseIterable {
    case two = 2
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

enum Suit: CaseIterable {
    case diamonds
    case hearts
    case clubs
    case spades
}


struct Deck {
    var cards: [Card] = []
    
    init() {
        makeDeck()
        shuffle()
    }
    
    
    mutating func makeDeck() {
        cards = []
        
        for suit in Suit.allCases {
            for value in Value.allCases {
                let card = Card(value: value, suit: suit)
                cards.append(card)
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    
    
}











struct Player {
    var hand: [Card] = []
    
    var wonCards: [Card] = []
    
    mutating func reshuffle() {
        if hand.count == 0 {
            hand = wonCards
            wonCards = []
        }
    }
}
