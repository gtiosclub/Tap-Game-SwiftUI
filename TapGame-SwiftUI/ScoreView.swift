//
//  ScoreView.swift
//  TapGame-SwiftUI
//
//  Created by Nate Thompson on 10/28/19.
//  Copyright © 2019 Nate Thompson. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var game: GameManager
    @State var showWinAlert = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Player 1: \(game.player1Score)")
                Spacer()
                Text("Player 2: \(game.player2Score)")
                Spacer()
            }
            Spacer()
            Button(action: {
                self.game.startGame(completionHandler: {
                    self.showWinAlert = true
                })
            }, label: {
                Text("Start Game")
                    .disabled(game.isGameActive)
            })
            Spacer()
        }
        .alert(isPresented: $showWinAlert) { () -> Alert in
            return winAlert
        }
    }
    
    var winAlert: Alert {
        var title: String
        var message: String

        if game.player1Score > game.player2Score {
            title = "Player 1 won! 🎉"
            message = "Score: \(game.player1Score)"
        } else if game.player2Score > game.player1Score {
            title = "Player 2 won! 🎉"
            message = "Score: \(game.player2Score)"
        } else {
            title = "It's a tie!"
            message = "Best out of 3?"
        }
        
        return Alert(title: Text(title),
                     message: Text(message),
                     dismissButton: .default(Text("OK")))
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
            .environmentObject(GameManager())
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
