//
//  KeyboardView.swift
//  CustomKeyboard
//
//  Created by Thanh Sau on 24/09/2023.
//

import SwiftUI
import UIKit

struct KeyboardView: View {
    
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
            
            ForEach(0...keyboard[shiftButtonState.rawValue].count - 1, id: \.self) { row in
                HStack {
                    ForEach(0...keyboard[shiftButtonState.rawValue][row].count - 1, id: \.self) { collumn in
                        keyboardButton(text: keyboard[shiftButtonState.rawValue][row][collumn])
                    }
                }
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(
            Image(uiImage: uiImage)
        )
    }
    
    
    @ViewBuilder
    func keyboardButton(text: String) -> some View {
        switch text {
        case "UPPERCASE":
            Image("icon_uppercase")
                .resizable()
                .scaledToFit()
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
                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    deleteTextAction()
                }
        case "123":
            Image("icon_number")
                .resizable()
                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    keyboard = Constants.numberKeys
                }
        case ".":
            Image("icon_dot")
                .resizable()
                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    inputTextAction(".")
                }
        case "SPACE":
            Image("icon_space")
                .resizable()
                .scaledToFit()
                .frame(height: 45)
                .onTapGesture {
                    inputTextAction(" ")
                }
        case ",":
            Image("icno_comma")
                .resizable()
                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    inputTextAction(",")
                }
        case "ENTER":
            Image("icon_enter")
                .resizable()
                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
                    inputTextAction("\n")
                }
        case "ABC":
            Image("icno_comma")
                .resizable()
                .scaledToFit()
                .frame(width: 32)
                .onTapGesture {
//                    keyboard = Constants.letterKeys
                }
        default:
            Image("icon_button")
                .resizable()
                .scaledToFit()
                .frame(width: 32)
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
    }
}
