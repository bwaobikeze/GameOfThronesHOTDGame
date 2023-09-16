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
                //Image("0_fire_off").resizable()
                Text("Game")
            }
            PointsView().tabItem {
                //Image("0_score_off").resizable()
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
