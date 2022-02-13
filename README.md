# SwiftUI_Slideoutmenu
This is a sample code project for a slideout menu.


https://user-images.githubusercontent.com/2520545/153758648-fe4a706f-5b96-4c9c-890e-b7dc640a4315.mp4


# How to Implement

1. Copy over the Model, Views, & HelperViews files to your project.
2. Add `SlideOutMenuView(showMenu: $showMenu)` to your mainview within a `ZStack` as an `if` statement. 

Example:

```                 
if showMenu {
  SlideOutMenuView(showMenu: $showMenu)
    .shadow(color: Color("nord2").opacity(0.5), radius: 5, x: 0, y: 0)
    .transition(.opacity)
    .animation(.easeInOut, value: showMenu)
  }
```

3. Add the `AnimationModifier` and `offset` to your view.

Example: 

```
VStack {
  YourView()
}
.modifier(AnimationModifier(showMenu: $showMenu, animationAmount: $animationAmount))
.offset(x: offset.width)
```

## Getting Started Code

```
VStack {
  YourView()
}
.modifier(AnimationModifier(showMenu: $showMenu, animationAmount: $animationAmount))
.onTapGesture {
    withAnimation {
        showMenu.toggle()
    }
}
.offset(x: offset.width)
.disabled(showMenu ? true : false)
if showMenu {
    SlideOutMenuView(showMenu: $showMenu)
        .shadow(color: Color("nord2").opacity(0.5), radius: 5, x: 0, y: 0)
        .transition(.opacity)
        .animation(.easeInOut, value: showMenu)
}
```

# Updating the Menu

1. Update `MenuItems` with your content
2. Update the `switch` statement within `SlideOutMenuView.swift`

Example: 

```
.onTapGesture {
    switch item.id {
    case 0:
        showSomeSheet1 = true
    case 1:
        showSomeSheet2 = true
    default:
        showSomeSheet3 = true
    }
}
```

3. Add the neccesary sheets needed.  There is a starter sheet located within `SlideOutMenuView.swift`.

# Calling the Slideout Menu

You can call the menu by utilzing a `Bool` State, in the code example I used `showMenu` and is triggered by swipping and a `toolbar` button.

## Code Examples

Button: 
```
.toolbar {
    ToolbarItem(placement: .cancellationAction) {
        Button(action: {
            withAnimation(.spring()) {
                showMenu = true
            }
        }) {
            Image(systemName: "gearshape.fill")
        }
    }
}
```

Swipe Gesture:

```
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
```    

# Customizing

## Menu Options
`MenuItemModel` contains the slideout menu options.  You could create another `model` for additonal options near the the top of the menu.

## Animation Modifier

I created a custom modifier `AnimationModifier` to reduce code.  This has the bulk of the 3d modifiers to animate the view in `ContentView`.

## Gesture Control

To increase or decrease edge detection update `if gesture.startLocation.x < CGFloat(50.0)`.  If you want to adjust how much a user needs to swipe you'll need to adjust `if offset.width > 115` in `ContentView.swift`

## Presenting Sheets

I placed sheets within  `SlideOutMenuView.swift` and have added one sheet as an example. You could also swap out sheet for a `fullScreenCover`

## Menu Size

Within in `SlideOutMenuView.swift` update the frame size located at `.frame(width: geo.size.width / 1.75)`.

## Other Notes

There is a `.disabled` modifier to disable `ContentView` when the menu appears otherwise the user could experience some weird behaviors if `ContentView` is still active. 

Feel free to email me with any questions robert.evansii@gmail.com

