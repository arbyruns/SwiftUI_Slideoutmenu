# SwiftUI_Slideoutmenu
This is a sample code project for a slideout menu.



https://user-images.githubusercontent.com/2520545/153758648-fe4a706f-5b96-4c9c-890e-b7dc640a4315.mp4


# Customizing

## Menu Options
`MenuItemModel` contains the slideout menu options.  You could create another `model` for additonal options near the the top of the menu.

## Animation Modifier

I created a custom modifier `AnimationModifier` to reduce code.  This has the bulk of the 3d modifiers to animate the view in `ContentView`.

## Gesture Control

To increase or decrease edge detection update `if gesture.startLocation.x < CGFloat(50.0)`.  If you want to adjust how much a user needs to swipe you'll need to adjust `if offset.width > 115` in `ContentView.swift`

## Presenting Sheets

I placed sheets within  `SlideOutMenuView.swift` and have added one sheet as an example.

Feel free to email me with any questions robert.evansii@gmail.com
