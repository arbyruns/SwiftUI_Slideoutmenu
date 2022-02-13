//
//  SlideOutMenuView.swift
//  
//
//  Created by robevans on 2/12/22.
//

import SwiftUI

struct SlideOutMenuView: View {
    @State var hideMenuRotate = true
    @State var showSheet = false
    @State var offset = CGSize.zero
    @State var selectedView = 0
    @Binding var showMenu: Bool

    @State var sampleItems: [String] = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("nord0").opacity(0.8), Color("nord4")]), startPoint: .bottom, endPoint: .top)
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            MenuCloseButton(hideMenuRotate: $hideMenuRotate)
                                .onTapGesture {
                                    withAnimation {
                                        hideMenuRotate.toggle()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                            withAnimation {
                                                showMenu = false
                                            }
                                        }
                                    }
                                }
                        }
                        HStack {
                            Image(systemName: "cpu.fill")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 13))
                            Text("Menu")
                                .font(.title)
                                .bold()
                        }
                        .padding(.leading)
                        .padding(.bottom)
                        Divider()
                        Spacer()
                        Divider()
                        ForEach(MenuItems){ item in
                            IconView(image: item.image, text: item.text, color: item.color)
                                .padding(.leading)
                                .onTapGesture {
                                    switch item.id {
                                    case 0:
                                        showSheet = true
                                    default:
                                        showSheet = true
                                    }
                                }
                        }
                    }
                }
                .frame(width: geo.size.width / 1.75)
                .sheet(isPresented: $showSheet) {
                    SheetView()
                }
            }
            .offset(x: offset.width)
            .opacity(2 - Double(abs(offset.width / 75)))
        }
        .animation(.spring())
        .transition(.move(edge: .leading))
        .zIndex(1)
        .gesture(DragGesture()
                    .onChanged { gesture in
            if gesture.translation.width < 0 {
                withAnimation {
                offset = gesture.translation
                }
            }
        }.onEnded{ value in
            if value.translation.width < -100 {
                withAnimation(.spring()) {
                    showMenu = false
                }
            } else {
                withAnimation(.spring()) {
                    offset = .zero
                }
            }
        })
    }
}

struct SlideOutMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SlideOutMenuView(showMenu: .constant(false))
    }
}
