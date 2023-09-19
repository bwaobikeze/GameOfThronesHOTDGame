//
//  ContentView.swift
//  Exercise4_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var player1Points: [Image] = []
        @State private var player2Points: [Image] = []
    @ObservedObject var pointsForPlayers = PlayerPoint()
    var body: some View {
        TabView {
            GameStartView(pointsForPlayers: pointsForPlayers)
                .tabItem {
                Image("fire_on")
                Text("Game")
            }
            PointsView(arrpoints: pointsForPlayers).tabItem {
                Image("score_on")
                Text("Points")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
