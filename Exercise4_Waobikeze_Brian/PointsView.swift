//
//  PointsView.swift
//  Exercise4_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/15/23.
//

import SwiftUI
class PlayerPoint: ObservableObject {
    @Published var player1Points = 0
    @Published var player2Points = 0
}
struct PointsView: View {
    @Environment(\.verticalSizeClass) var heightSize: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSize: UserInterfaceSizeClass?
    @ObservedObject var arrpoints: PlayerPoint

    
    var body: some View {

        if heightSize == .compact{
            VStack(spacing: 10) {
                Image("0_HOD_text").resizable().scaledToFit()
                HStack(spacing: 50) {
                    VStack(spacing: 20 ) {
                        Text("Player 1").font(Font.custom("Academy Engraved LET Plain:1.0", size: 50))
                        HStack(spacing: 10) {
                            PointImage(isActive: arrpoints.player1Points >= 1)
                            PointImage(isActive: arrpoints.player1Points >= 2)
                            PointImage(isActive: arrpoints.player1Points >= 3)
                        }
                    }
                    VStack(spacing: 20 ) {
                        Text("Player 2").font(Font.custom("Academy Engraved LET Plain:1.0", size: 50))
                        HStack(spacing: 10) {
                            PointImage(isActive: arrpoints.player2Points >= 1)
                            PointImage(isActive: arrpoints.player2Points >= 2)
                            PointImage(isActive: arrpoints.player2Points >= 3)
                        }
                    }
                }
            }
        }
        else if heightSize == .regular{
            VStack(alignment: .center, spacing: 50 ) {
                Image("0_HOD_text").resizable().scaledToFit()
                Text("Player 1").font(Font.custom("Academy Engraved LET Plain:1.0", size: 50))
                HStack(spacing: 10) {
                    PointImage(isActive: arrpoints.player1Points >= 1)
                    PointImage(isActive: arrpoints.player1Points >= 2)
                    PointImage(isActive: arrpoints.player1Points >= 3)
                }
                Text("Player 2").font(Font.custom("Academy Engraved LET Plain:1.0", size: 50))
                HStack(spacing: 10) {
                    PointImage(isActive: arrpoints.player2Points >= 1)
                    PointImage(isActive: arrpoints.player2Points >= 2)
                    PointImage(isActive: arrpoints.player2Points >= 3)
                }
                Spacer()
            }.padding(.top)
        }
        else{
            Text("UnKnown")
        }

    }
}
struct PointImage: View {
    let isActive: Bool

    var body: some View {
        Image(isActive ? "0_HOD_logo" : "0_HOD_logo")
            .resizable().scaledToFit().frame(width: 100, height: 100)
            .opacity(isActive ? 1.0 : 0.3)
    }
}

//struct PointsView_Previews: PreviewProvider {
//    @ObservedObject var pointsForPlayers = PlayerPoint()
//    static var previews: some View {
//        PointsView(arrpoints: pointsForPlayers)
//    }
//}
