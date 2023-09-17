//
//  GameStartView.swift
//  Exercise4_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/15/23.
//

import SwiftUI
import AVKit

class SoundManager{
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "dracarys1", withExtension: ".mp3") else{return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}
struct GameStartView: View {
    @State var Player1Iter = 0
    @State var Player2Iter = 0
    @Environment(\.verticalSizeClass) var heightSize: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSize: UserInterfaceSizeClass?
    let Dragons: [UIImage] = [UIImage(imageLiteralResourceName: "0_HOD_logo"),UIImage(imageLiteralResourceName: "3_Viserion"),UIImage(imageLiteralResourceName: "3_Stormcloud"), UIImage(imageLiteralResourceName: "3_Drogon"),UIImage(imageLiteralResourceName: "2_Silverwing"),UIImage(imageLiteralResourceName: "2_Quicksilver"),UIImage(imageLiteralResourceName: "2_Meleys"),UIImage(imageLiteralResourceName: "1_Sheepstealer"),UIImage(imageLiteralResourceName: "1_Meraxes"),UIImage(imageLiteralResourceName: "1_Balerion")]
    
    var body: some View {
        if heightSize == .compact{
            //Text("LandScape")
            HStack(spacing: 100) {
                VStack(alignment: .center, spacing: 20 ) {
                    Image("0_HOD_text").resizable().scaledToFit()
                    HStack(spacing: 100) {
                        Text("Player 1").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                        Text("Player 2").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                    }
                    HStack(spacing: 20) {
                        Image(uiImage:Dragons[Player1Iter]).resizable().scaledToFit().frame(width: 180, height: 180)
                        Image(uiImage:Dragons[Player2Iter]).resizable().scaledToFit().frame(width: 180, height: 180)
                    }
                }
                VStack(alignment: .center, spacing: 20 ) {
                    Text("Prepare for the Battle!").font(Font.custom("Academy Engraved LET Plain:1.0", size: 20))
                    HStack(spacing: 100) {
                        Text("Restart").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                        Text("Figth").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                    }
                    HStack(spacing: 20) {
                        Button(action:{
                            //action
                            retart()
                        }){
                            Image("0_refresh_arrows").resizable().scaledToFit().frame(width: 150, height: 150)
                        }
                        
                        
                        Button(action:{
                            //action
                            SoundManager.instance.playSound()
                            fight()
                        }){
                            Image("0_crossing-swords").resizable().scaledToFit().frame(width: 150, height: 150)
                        }
                    }
                }
            }
        }
        else if heightSize == .regular{
            VStack(alignment: .center, spacing: 20 ) {
                       Image("0_HOD_text").resizable().scaledToFit()
                       
                       HStack(spacing: 100) {
                           Text("Player 1").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                           Text("Player 2").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                       }
                       HStack(spacing: 20) {
                           Image(uiImage:Dragons[Player1Iter]).resizable().scaledToFit().frame(width: 180, height: 180)
                           Image(uiImage:Dragons[Player2Iter]).resizable().scaledToFit().frame(width: 180, height: 180)
                       }
                       Spacer()
                       Text("Prepare for the Battle!").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                       Spacer()
                       HStack(spacing: 100) {
                           Text("Restart").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                           Text("Figth").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                       }
                       HStack(spacing: 20) {
                           Button(action:{
                               //action
                               retart()
                           }){
                               Image("0_refresh_arrows").resizable().scaledToFit().frame(width: 150, height: 150)
                           }
                           
                           
                           Button(action:{
                               //action
                               SoundManager.instance.playSound()
                               fight()
                           }){
                               Image("0_crossing-swords").resizable().scaledToFit().frame(width: 150, height: 150)
                           }
                       }
                       Spacer()
                       
                   }
                   .padding(.top)
        }
        else{
            Text("UnKnown")
        }

        
       
    }
    func retart(){
        Player1Iter = 0
        Player2Iter = 0
    }
    func fight(){
        Player1Iter = Int.random(in: 1..<Dragons.count)
        Player2Iter = Int.random(in: 1..<Dragons.count)
        if Player1Iter == Player2Iter{
            fight()
        }
    }
    
}
struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView()
    }
}
