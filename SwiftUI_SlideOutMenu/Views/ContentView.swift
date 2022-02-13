//
//  ContentView.swift
//  SwiftUI_SlideOutMenu
//
//  Created by robevans on 2/13/22.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @State var animationAmount = 2
    @State var offset = CGSize.zero

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("nord0").opacity(0.8), Color("nord4")]), startPoint: .bottom, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 13)
                            .fill(Color("nord12"))
                            .frame(width: 250, height: 175, alignment: .center)
                        Text("👋Hello\n Tap me")
                            .font(.largeTitle)
                            .bold()
                    }
                }
                .zIndex(1)
                .modifier(AnimationModifier(showMenu: $showMenu, animationAmount: $animationAmount))
                .onTapGesture {
                    withAnimation {
                        showMenu.toggle()
                    }
                }
                .offset(x: offset.width)
                if showMenu {
                    SlideOutMenuView(showMenu: $showMenu)
                        .shadow(color: Color("nord2").opacity(0.5), radius: 5, x: 0, y: 0)
                        .transition(.opacity)
                        .animation(.easeInOut, value: showMenu)
                }
            }
            .navigationTitle("SlideOutMenu")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(showMenu ? true : false)
            .gesture(DragGesture()
                        .onChanged { gesture in
                // increase startLocation to increase edge detection
                if gesture.startLocation.x < CGFloat(50.0) {
                    withAnimation {
                        offset = gesture.translation
                    }
                }
            }.onEnded{ value in
                if offset.width > 115 {
                    withAnimation(.spring()) {
                        showMenu = true
                        offset = .zero
                    }
                } else {
                    withAnimation(.spring()) {
                        offset = .zero
                    }
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
