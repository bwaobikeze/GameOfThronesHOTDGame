//
//  PointsView.swift
//  Exercise4_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/15/23.
//

import SwiftUI

struct PointsView: View {
    @Environment(\.verticalSizeClass) var heightSize: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSize: UserInterfaceSizeClass?
    let Player1Points: [Image] = [Image("0_HOD_logo"),
                                    Image("0_HOD_logo"),
                                    Image("0_HOD_logo")]
    let Player2Points: [Image] = [Image("0_HOD_logo"),
                                    Image("0_HOD_logo"),
                                    Image("0_HOD_logo")]
    var body: some View {
        if heightSize == .compact{
            VStack(spacing: 10) {
                Image("0_HOD_text").resizable().scaledToFit()
                HStack(spacing: 50) {
                    VStack(spacing: 20 ) {
                        Text("Player 1").font(Font.custom("Academy Engraved LET Plain:1.0", size: 50))
                        HStack(spacing: 10) {
                            ForEach(Player1Points.indices, id: \.self){index in
                                Player1Points[index].resizable().scaledToFit().frame(width: 100, height: 100).opacity(0.3)
                            }
                        }
                    }
                    VStack(spacing: 20 ) {
                        Text("Player 2").font(Font.custom("Academy Engraved LET Plain:1.0", size: 50))
                        HStack(spacing: 10) {
                            ForEach(Player2Points.indices, id: \.self){index in
                                Player2Points[index].resizable().scaledToFit().frame(width: 100, height: 100).opacity(0.3)
                            }
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
                    ForEach(Player1Points.indices, id: \.self){index in
                        Player1Points[index].resizable().scaledToFit().frame(width: 100, height: 100).opacity(0.3)
                     }
                }
                Text("Player 2").font(Font.custom("Academy Engraved LET Plain:1.0", size: 50))
                HStack(spacing: 10) {
                    ForEach(Player2Points.indices, id: \.self){index in
                        Player2Points[index].resizable().scaledToFit().frame(width: 100, height: 100).opacity(0.3)
                     }
                }
                Spacer()
            }.padding(.top)
        }
        else{
            Text("UnKnown")
        }

    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
    }
}
