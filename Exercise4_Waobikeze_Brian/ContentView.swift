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
    @State private var isGameTabSelected = false
    @State private var isPointsTabSelected = false
    
    var body: some View {
        TabView {
            GameStartView(pointsForPlayers: pointsForPlayers)
                .tabItem {
                    Image(isGameTabSelected ? "fire_on" : "fire_off")
                Text("Game")
            }
                .onAppear {
                    isGameTabSelected = true // Set the tab selected state
                }
                .onDisappear {
                    isGameTabSelected = false // Reset the tab selected state
                }
            PointsView(arrpoints: pointsForPlayers).tabItem {
                Image(isPointsTabSelected ? "score_on" : "score_off")
                Text("Points")
            }
            .onAppear {
                isPointsTabSelected = true // Set the tab selected state
            }
            .onDisappear {
                isPointsTabSelected = false // Reset the tab selected state
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
