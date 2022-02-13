//
//  File.swift
//  
//
//  Created by robevans on 2/12/22.
//

import Foundation
import SwiftUI

struct AnimationModifier : ViewModifier{
    
    @Binding var showMenu: Bool
    @Binding var animationAmount: Int

    func body(content: Content) -> some View {
        content
            .offset(x: showMenu ? 90 : 0)
            .rotation3DEffect(
                .degrees(showMenu ? -35 : 0),
                axis: (x: 0, y: 90, z: 0.0))
            .scaleEffect(showMenu ? 0.8 : 1.0)
            .disabled(showMenu ? true : false)
            .opacity(showMenu ? 0.5 : 1.0)
            .transition(.slide)
            .animation(.easeInOut, value: animationAmount)
    }
}
