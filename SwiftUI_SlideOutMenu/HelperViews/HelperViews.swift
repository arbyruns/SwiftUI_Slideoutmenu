//
//  SwiftUIView.swift
//  
//
//  Created by robevans on 2/12/22.
//

import SwiftUI

struct MenuCloseButton: View {
    @Binding var hideMenuRotate: Bool

     var body: some View {
        Group {
            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 30, height: 4)
                    .opacity(hideMenuRotate ? 0 : 1)
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 30, height: 4)
                    .rotationEffect(.degrees(hideMenuRotate ? -45 : 0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 30, height: 4)
                            .rotationEffect(.degrees(hideMenuRotate ? 45 : 0))
                    )
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 30, height: 4)
                    .opacity(hideMenuRotate ? 0 : 1)
            }
            .rotationEffect(.degrees(hideMenuRotate ? 0 : 180))
            .padding(.trailing, 8)
        }
    }
}

struct MenuItemView: View {
    @Binding var selectedView: Int
    @Binding var showMenu: Bool

     var body: some View {
        HStack {
            Image(systemName: "checkmark")
            Text("Placeholder")
            Spacer()
            Image(systemName: "circle")
                .animation(.easeOut)
        }
        .padding(.vertical, 6)
        .padding(.horizontal)
        .onTapGesture {
            withAnimation {
                selectedView = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation {
                        showMenu = false
                    }
                }
            }
        }
    }
}

struct MenuItemRowView: View {
    @Binding var selectedView: Int

     var body: some View {
        HStack {
            Image(systemName: "checkmark")
            Text("PlaceHolder")
        }
        .padding(.vertical, 6)
        .padding(.horizontal)
    }
}

struct IconView: View {

    var image: String
    var text: String
    var color: String

    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.title2)
                .frame(width: 35, height: 35, alignment: .center)
                .background(Color(color))
                .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
            Text(text)
                .bold()
        }
    }
}

struct HelperViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
        MenuCloseButton(hideMenuRotate: .constant(false))
            MenuItemView(selectedView: .constant(0), showMenu: .constant(false))
            MenuItemView(selectedView: .constant(0), showMenu: .constant(false))
        }
    }
}
