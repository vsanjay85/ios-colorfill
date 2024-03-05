//
//  ContentView.swift
//  ColorFill
//
//  Created by Sanjay Varanasi on 2024-02-07.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(.white, lineWidth: 4)
                .padding(.horizontal)
            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
                Text("Tap a color to fill screen \n Tap again to return here")
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                    .padding(.all)
//                    .bold()

                HStack {
                    PickerView(fillColor: .white)
                    PickerView(fillColor: .red)
                    PickerView(fillColor: .yellow)
                    PickerView(fillColor: .green)
                }
            }
        }
        .padding(0.0)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .preferredColorScheme(.light)
}

struct PickerView: View {
    @State var fillColor: Color = .blue
    @State private var isFullScreen = false
    var body: some View {
        HStack {
            let rect = RoundedRectangle(cornerRadius: 20.0)
            rect
                .fill(fillColor)
                .frame(width: 80.0, height: 80.0)
                .overlay( /// apply a rounded border
                    rect
                        .stroke(.gray, lineWidth: 2)
                )
                .fullScreenCover(isPresented: $isFullScreen) {
                    FullScreen(isFullScreen: $isFullScreen, fillColor: $fillColor)
                }
                .onTapGesture {
                    isFullScreen.toggle()
                }
        }
    }
}

struct FullScreen: View {

    @Binding var isFullScreen: Bool
    @Binding var fillColor: Color
    let myColor: Color = .gray
    var body: some View {
        ZStack {
            fillColor
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true)

        }.onTapGesture {
            self.isFullScreen.toggle()
        }
    }
}

extension UIViewController {
    func prefersStatusBarHidden() -> Bool {
        return true
    }
}
