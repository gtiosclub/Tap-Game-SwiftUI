//
//  ContentView.swift
//  TapGame-SwiftUI
//
//  Created by Nate Thompson on 10/28/19.
//  Copyright © 2019 Nate Thompson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var game: GameManager
    
    var body: some View {
        VStack() {
            Button(action: {
                if self.game.isGameActive {
                    self.game.player1Score += 1
                }
            }, label: {
                Text("Player 1")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity,
                           minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color.red)
            })
            
            ScoreView()
                .environmentObject(game)
                .frame(minWidth: 0, maxWidth: .infinity,
                       minHeight: 0, maxHeight: .infinity, alignment: .center)
            
            
            Button(action: {
                if self.game.isGameActive {
                    self.game.player2Score += 1
                }
            }, label: {
                Text("Player 2")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity,
                           minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color.orange)
            })
            
        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity, alignment: .center)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameManager())
    }
}
