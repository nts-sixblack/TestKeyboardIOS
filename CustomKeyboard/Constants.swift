//
//  Constants.swift
//  CustomKeyboard
//
//  Created by Thanh Sau on 24/09/2023.
//

import Foundation
import UIKit

enum Constants{
    
    static let keyNormalColour: UIColor = .white
    static let keyPressedColour: UIColor = .lightText
    static let specialKeyNormalColour: UIColor = .gray

//    static let letterKeys: [[String]] = [
//        ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
//        ["a", "s", "d", "f", "g","h", "j", "k", "l"],
//        ["UPPERCASE", "z", "x", "c", "v", "b", "n", "m", "DELETE"],
//        ["123", ",", "SPACE", ".", "ENTER"]
//    ]
    
//
    
    static let letterKeys = [
        [
            ["𝕢", "𝕨", "𝕖", "𝕣", "𝕥", "𝕪", "𝕦", "𝕚", "𝕠", "𝕡"],
            ["𝕒", "𝕤", "𝕕", "𝕗", "𝕘","𝕙", "𝕛", "𝕜", "𝕝"],
            ["UPPERCASE", "𝕫", "𝕩", "𝕔", "𝕧", "𝕓", "𝕟", "𝕞", "DELETE"],
            ["123", ".", "SPACE", ",", "ENTER"]
        ],
        [
            ["ℚ", "𝕎", "𝔼", "ℝ", "𝕋", "𝕐", "𝕌", "𝕀", "𝕆", "ℙ"],
            ["𝔸", "𝕊", "𝔻", "𝔽", "𝔾","ℍ", "𝕁", "𝕂", "𝕃"],
            ["UPPERCASE", "ℤ", "𝕏", "ℂ", "𝕍", "𝔹", "ℕ", "𝕄", "DELETE"],
            ["123", ".", "SPACE", ",", "ENTER"]
        ]
    ]
    
    static let numberKeys = [
        [
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0",],
            ["-", "/", ":", ";", "(", ")" ,",", "$", "&", "@", "\""],
            ["#+=",".", ",", "?", "!", "\'", "⌫"],
            ["ABC", "🌐", "SPACE", "↩"]
        ],
        [
            ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
            ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "·"],
            ["123",".", ",", "?", "!", "\'", "⌫"],
            ["ABC", "🌐", "SPACE", "↩"]
        ]
    ]
    
//    static let symbolKeys = [
//        ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
//        ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "·"],
//        ["123",".", ",", "?", "!", "\'", "⌫"],
//        ["ABC", "🌐", "SPACE", "↩"]
//    ]
}
