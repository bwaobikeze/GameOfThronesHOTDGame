//
//  TitleScreen.swift
//  Exercise4_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/17/23.
//

import SwiftUI
import AVKit
struct TitleScreen: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            //SoundManager.instance.playSound2()
            Image("0_HOD_logo").resizable().scaledToFit()
            Image("0_HOD_text").resizable().scaledToFit()
        }
    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
