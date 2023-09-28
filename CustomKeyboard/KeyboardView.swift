//
//  KeyboardView.swift
//  CustomKeyboard
//
//  Created by Thanh Sau on 24/09/2023.
//

import SwiftUI
import UIKit

struct KeyboardView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    enum KeyboardState: Int {
        case letters
        case numbers
    }
    
    enum ShiftButtonState: Int {
        case normal = 0
        case shift = 1
    }
    
    var uiImage: UIImage
    let nextKeyboardAction: Selector
    let inputTextAction: (String) -> Void
    let deleteTextAction: () -> Void
    
    @State var keyboard: [[[String]]] = Constants.letterKeys
    
    @State var keyboardState: KeyboardState = .letters
    @State var shiftButtonState: ShiftButtonState = .shift
    
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        VStack {
            
            HStack  {
                HStack (alignment: .bottom, spacing: 28) {
                    Image("icon_arrow_left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                    
                    Image("icon_paint")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                    
                    Image("icon_paste")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                    
                    Image("icon_translate")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                    
                    Image("icon_line_horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                    
                    Image("icon_ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                    
                    Image("icon_arrow_down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                }
                .frame(height: 16)
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 30)
            .overlay {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 1.5)
            }
            .padding(.horizontal)
            
            VStack (spacing: 0, content: {
                HStack {
                    ForEach(0...keyboard[shiftButtonState.rawValue][0].count - 1, id: \.self) { collumn in
                        keyboardButton(text: keyboard[shiftButtonState.rawValue][0][collumn])
                    }
                }
                .frame(maxHeight: 40)
                
                HStack {
                    ForEach(0...keyboard[shiftButtonState.rawValue][1].count - 1, id: \.self) { collumn in
                        keyboardButton(text: keyboard[shiftButtonState.rawValue][1][collumn])
                    }
                }
                .padding(.horizontal)
                .frame(maxHeight: 40)
                
                HStack {
                    ForEach(0...keyboard[shiftButtonState.rawValue][2].count - 1, id: \.self) { collumn in
                        keyboardButton(text: keyboard[shiftButtonState.rawValue][2][collumn])
                    }
                }
                .padding(.horizontal)
                .frame(maxHeight: 40)
                
                HStack {
                    ForEach(0...keyboard[shiftButtonState.rawValue][3].count - 1, id: \.self) { collumn in
                        keyboardButton(text: keyboard[shiftButtonState.rawValue][3][collumn])
                    }
                }
                .frame(maxHeight: 40)
            })
            
            
            
            
//            ForEach(0...keyboard[shiftButtonState.rawValue].count - 1, id: \.self) { row in
//                HStack {
//                    ForEach(0...keyboard[shiftButtonState.rawValue][row].count - 1, id: \.self) { collumn in
//                        keyboardButton(text: keyboard[shiftButtonState.rawValue][row][collumn])
//                    }
//                }
//            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 1)
        .background(
            Image(uiImage: uiImage)
        )
        .onRotate { newOrientation in
            orientation = newOrientation
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification), perform: { output in
            print(output)
        })
    }
    
    
    @ViewBuilder
    func keyboardButton(text: String) -> some View {
        switch text {
        case "UPPERCASE":
            Image("icon_uppercase")
                .resizable()
//                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    if shiftButtonState != .normal {
                        shiftButtonState = .normal
                    } else {
                        shiftButtonState = .shift
                    }
                }
        case "DELETE":
            Image("icon_delete")
                .resizable()
//                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    deleteTextAction()
                }
        case "123":
            Image("icon_number")
                .resizable()
//                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    keyboard = Constants.numberKeys
                }
        case ".":
            Image("icon_dot")
                .resizable()
//                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    inputTextAction(".")
                }
        case "SPACE":
            Image("icon_space")
                .resizable()
//                .scaledToFit()
                .frame(height: 45)
                .onTapGesture {
                    inputTextAction(" ")
                }
        case ",":
            Image("icno_comma")
                .resizable()
//                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    inputTextAction(",")
                }
        case "ENTER":
            Image("icon_enter")
                .resizable()
//                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    inputTextAction("\n")
                }
        case "ABC":
            Image("icno_comma")
                .resizable()
//                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
//                    keyboard = Constants.letterKeys
                }
        default:
            Image((horizontalSizeClass == .compact && verticalSizeClass == .regular) ? "icon_button" : "icno_comma")
                .resizable()
//                .scaledToFit()
                .overlay {
                    Text(text)
                        .foregroundColor(.white)
                        .padding(.bottom, 3)
                }
                .onTapGesture {
                    inputTextAction(text)
                    if shiftButtonState != .normal {
                        shiftButtonState = .normal
                    }
                }
        }
        
    }
}

struct Keyboard_Preview: PreviewProvider {
    static var previews: some View {
        KeyboardView(uiImage: UIImage(), nextKeyboardAction: Selector("")) { _ in
            
        } deleteTextAction: {
            
        }
        .previewInterfaceOrientation(.landscapeLeft)
        
        KeyboardView(uiImage: UIImage(), nextKeyboardAction: Selector("")) { _ in
            
        } deleteTextAction: {
            
        }
        .previewInterfaceOrientation(.portrait)
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}
