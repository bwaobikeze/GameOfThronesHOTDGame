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
    var body: some View {
        VStack(alignment: .center, spacing: 20 ) {
            Image("0_HOD_text").resizable().scaledToFit()

            HStack(spacing: 100) {
                Text("Player 1").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
                Text("Player 2").font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
            }
            HStack(spacing: 20) {
                Image("0_HOD_logo").resizable().scaledToFit().frame(width: 180, height: 180)
                Image("0_HOD_logo").resizable().scaledToFit().frame(width: 180, height: 180)
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
                }){
                    Image("0_refresh_arrows").resizable().scaledToFit().frame(width: 150, height: 150)
                }
                
                
                Button(action:{
                    //action
                    SoundManager.instance.playSound()
                }){
                    Image("0_crossing-swords").resizable().scaledToFit().frame(width: 150, height: 150)
                }
            }
            Spacer()

        }
        .padding(.top)
    }
}

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView()
    }
}
