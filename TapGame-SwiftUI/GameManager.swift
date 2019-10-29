//
//  GameManager.swift
//  TapGame-SwiftUI
//
//  Created by Nate Thompson on 10/28/19.
//  Copyright © 2019 Nate Thompson. All rights reserved.
//

import SwiftUI
import Combine

class GameManager: ObservableObject {    
    @Published var player1Score = 0
    @Published var player2Score = 0
    @Published var isGameActive = false
    
    func startGame(completionHandler: @escaping () -> Void) {
        player1Score = 0
        player2Score = 0
        isGameActive = true
        
        let _ = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
            self.isGameActive = false
            completionHandler()
        }
    }
}
