//
//  ContentView.swift
//  Exercise4_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GameStartView()
                .tabItem {
                Image("fire_on")
                Text("Game")
            }
            PointsView().tabItem {
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
