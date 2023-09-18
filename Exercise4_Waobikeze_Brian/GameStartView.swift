//
//  GameStartView.swift
//  Exercise4_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/15/23.
//

import SwiftUI
import AVKit


//extra feature
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
    func playSound2(){
        guard let url = Bundle.main.url(forResource: "House of the Dragon Opening Credits 4K  Season 1 (HBO)  Game Of Thrones Extras", withExtension: ".mp3") else{return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
    func stopSound() {
        player?.stop()
    }
}
class DrogonImagesAndRank{
    let dragonImage: UIImage
    let rankNum: Int
    init(dragonImage: UIImage, rankNum: Int) {
        self.dragonImage = dragonImage
        self.rankNum = rankNum
    }
}

struct GameStartView: View {
    @State var Player1Iter = 0
    @State var Player2Iter = 0
    @State var Player1PointIncrease = 0
    @State var Player2PointIncrease = 0
    @State var Player1ImageChange = 0
    @State var Player2ImageChnage = 0
    @ObservedObject var pointsArrays = PointsArrays()
    
    @State var GameMessage: Text = Text("Prepare for the Battle!")
    @Environment(\.verticalSizeClass) var heightSize: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSize: UserInterfaceSizeClass?
    
    @State var DragsWithRank: [DrogonImagesAndRank] = []
    
    let Dragons: [UIImage] = [UIImage(imageLiteralResourceName: "0_HOD_logo"),UIImage(imageLiteralResourceName: "3_Viserion"),UIImage(imageLiteralResourceName: "3_Drogon"),UIImage(imageLiteralResourceName: "3_Stormcloud"),UIImage(imageLiteralResourceName: "2_Quicksilver"),UIImage(imageLiteralResourceName: "2_Meleys"),UIImage(imageLiteralResourceName: "2_Silverwing"),UIImage(imageLiteralResourceName: "1_Sheepstealer"),UIImage(imageLiteralResourceName: "1_Meraxes"),UIImage(imageLiteralResourceName: "1_Balerion")]
    init() {
        var dragsWithRank: [DrogonImagesAndRank] = []
        for (index, dragon) in Dragons.enumerated() {
            let drogonImageAndRank = DrogonImagesAndRank(dragonImage: dragon, rankNum: index)
            dragsWithRank.append(drogonImageAndRank)
        }
        self._DragsWithRank = State(initialValue: dragsWithRank)
    }
    
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
                        Image(uiImage:DragsWithRank[Player1Iter].dragonImage).resizable().scaledToFit().frame(width: 180, height: 180)
                        Image(uiImage:DragsWithRank[Player2Iter].dragonImage).resizable().scaledToFit().frame(width: 180, height: 180)
                    }
                }
                VStack(alignment: .center, spacing: 20 ) {
                    GameMessage.font(Font.custom("Academy Engraved LET Plain:1.0", size: 20))
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
                        .disabled(Player1PointIncrease == 3 || Player2PointIncrease == 3)
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
                           Image(uiImage:DragsWithRank[Player1Iter].dragonImage).resizable().scaledToFit().frame(width: 180, height: 180)
                           Image(uiImage:DragsWithRank[Player2Iter].dragonImage).resizable().scaledToFit().frame(width: 180, height: 180)
                       }
                       Spacer()
                        GameMessage.font(Font.custom("Academy Engraved LET Plain:1.0", size: 30))
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
                           .disabled(Player1PointIncrease == 3 || Player2PointIncrease == 3)
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
        GameMessage = Text("Prepare for the Battle!")
    }
    func fight(){
        Player1Iter = Int.random(in: 1..<Dragons.count)
        Player2Iter = Int.random(in: 1..<Dragons.count)
        if Player1Iter == Player2Iter{
            fight()
        }
        WhoIsWinner(P1Rank: Player1Iter, P2Rank: Player2Iter)
    }
    func WhoIsWinner(P1Rank:Int, P2Rank:Int){
        if DragsWithRank[P1Rank].rankNum > DragsWithRank[P2Rank].rankNum{
            setFirstImageOpacityToOne(forPlayer: 1, index:  Player1ImageChange)
            Player1ImageChange += 1
            Player1PointIncrease += 1
            if Player1PointIncrease == 3 {
                GameMessage = Text("Player 1 Wins the game!")
            } else {
                GameMessage = Text("Player 1 Wins the round!")
            }
        }
        else{
            setFirstImageOpacityToOne(forPlayer: 2, index: Player2ImageChnage)
            Player2ImageChnage += 1
             Player2PointIncrease += 1
             if Player2PointIncrease == 3 {
                 GameMessage = Text("Player 2 Wins the game!")
             } else {
                 GameMessage = Text("Player 2 Wins the round!")
             }
        }
    }
    
    
    func setFirstImageOpacityToOne(forPlayer player: Int, index: Int) {
        var pointsArray: [Image]

        if player == 1 {
            pointsArray = pointsArrays.Player1Points
        } else {
            pointsArray = pointsArrays.Player2Points
        }

    }
    
    
    
}
struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView()
    }
}
