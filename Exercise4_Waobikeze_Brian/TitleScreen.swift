//
//  TitleScreen.swift
//  Exercise4_Waobikeze_Brian
//
//  Created by brian waobikeze on 9/17/23.
//

import SwiftUI
import AVKit
struct TitleScreen: View {
    @State private var isGameStartViewActive = false
    @State private var isRotating = 0.0
    var body: some View {
        NavigationView {
            VStack {
                Image("0_HOD_logo")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(isRotating))
                    .onAppear {
                        withAnimation(.linear(duration: 1)
                                                .speed(0.1).repeatForever(autoreverses: false)) {
                                            isRotating = 360.0
                                        }
                    }
                Image("0_HOD_text")
                    .resizable()
                    .scaledToFit()

                NavigationLink(
                    destination:ContentView(),
                    isActive: $isGameStartViewActive
                ) {
                    EmptyView()
                }
                .onAppear {
                    SoundManager.instance.playSound2()
                }

                Button(action: {
                    SoundManager.instance.stopSound()
                    isGameStartViewActive = true
                }) {
                    Text("Start Game")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
