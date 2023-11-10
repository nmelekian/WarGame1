//
//  main.swift
//  War2
//
//  Created by Nick Melekian on 11/9/23.
//

import Foundation






struct War {
    var deck: Deck = Deck()
    var player1 = Player()
    var player2 = Player()
    
    mutating func deal() {
        for index in deck.cards.indices {
            if index % 2 == 0 {
                player1.hand.append(deck.cards[index])
            } else {
                player2.hand.append(deck.cards[index])
            }
            
        }
    }
    
    
    mutating func playHand() {
        if player1.hand[0] > player2.hand[0] {
            print(player1.hand[0].value, player1.hand[0].suit)
            print(player2.hand[0].value, player2.hand[0].suit)
            player1.wonCards.append(player2.hand.removeFirst())
            player1.wonCards.append(player1.hand.removeFirst())
            player1.reshuffle()
            player2.reshuffle()
        } else if player1.hand[0] < player2.hand[0] {
            print(player1.hand[0].value, player1.hand[0].suit)
            print(player2.hand[0].value, player2.hand[0].suit)
            player2.wonCards.append(player2.hand.removeFirst())
            player2.wonCards.append(player1.hand.removeFirst())
            player2.reshuffle()
            player1.reshuffle()
        } else {
            // we tied our cards, now what?
            print("ITS WAR")
            var winPile: [Card] = []
            repeat {
                player2.reshuffle()
                player1.reshuffle()
                let p1PrimaryCard = player1.hand.removeFirst()
                let p2PrimaryCard = player2.hand.removeFirst()
                winPile.append(p1PrimaryCard)
                winPile.append(p2PrimaryCard)
                let p1Sacrifice = player1.hand.removeFirst()
                let p2Sacrifice = player2.hand.removeFirst()
                winPile.append(p1Sacrifice)
                winPile.append(p2Sacrifice)
                
                if player1.hand[0] > player2.hand[0] {
                    print(player1.hand[0].value, player1.hand[0].suit)
                    print(player2.hand[0].value, player2.hand[0].suit)
                    player1.wonCards.append(player2.hand.removeFirst())
                    player1.wonCards.append(player1.hand.removeFirst())
                    player1.hand.append(contentsOf: winPile)
                    player2.reshuffle()
                    player1.reshuffle()
                    print("player1 wins the war")
                } else if player1.hand[0] < player2.hand[0] {
                    print(player1.hand[0].value, player1.hand[0].suit)
                    print(player2.hand[0].value, player2.hand[0].suit)
                    print("player2 wins the war")
                    player2.wonCards.append(player2.hand.removeFirst())
                    player2.wonCards.append(player1.hand.removeFirst())
                    player2.hand.append(contentsOf: winPile)
                    player2.reshuffle()
                    player1.reshuffle()
                }
                
                
            } while player1.hand[0] == player2.hand[0]
            
            
        }
        
    }
    
    
    
    
}

var game = War()

game.deal()

for _ in 0...50 {
    while game.player1.hand.count > 0 && game.player2.hand.count > 0 {
        game.playHand()
    }
}


print("player 1 hand count:", game.player1.hand.count + game.player1.wonCards.count)
print("player 2 hand count:", game.player2.hand.count + game.player2.wonCards.count)

