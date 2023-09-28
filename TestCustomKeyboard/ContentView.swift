//
//  ContentView.swift
//  TestCustomKeyboard
//
//  Created by Thanh Sau on 24/09/2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var text: String = ""
    
    let start = 0x1F600
    let end = 0x1F64F
    
    @State private var showSheet = false
    
    @State private var suggestList: [String] = []
    
    @State private var translateLanguage: String = ""
    
    let languageCode = Locale.current.languageCode
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! 🤗 ")
            
            
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(suggestList, id: \.self) { value in
                        Text(value)
                    }
                }
            }
            
            TextField("input text", text: $text)
                .onChange(of: text) { newValue in
                    suggestList = getSuggestion(value: newValue)
                }
            
            Button(action: {
                suggestList = getSuggestion(value: "a")
            }, label: {
                Text("Suggestion")
            })
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            List((start...end), id: \.self) { codePoint in
                if let unicodeScalar = UnicodeScalar(codePoint) {
                    let character = String(unicodeScalar)
                    Text("Unicode U+\(String(format: "%04X", codePoint)): \(character)")
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, onSelectImage: { image in
                DispatchQueue.global(qos: .background).async {
                    if let imageData = image.pngData() {
                        let base64 = imageData.base64EncodedString()
                        
                        print(base64)
                    }
                }
            })
        }
        .padding()
        
    }
    
    private func getSuggestion(value: String) -> [String] {
       print("\(languageCode ?? "")")
        let rangeForEndOfStr = NSMakeRange(0, value.utf16.count)
        let spellChecker = UITextChecker()
        let completions = spellChecker.completions(forPartialWordRange: rangeForEndOfStr, in: value, language: "\(languageCode ?? "en")")
        print(completions ?? "No completion found")
        
        return completions ?? []
    }
    
}

#Preview {
    ContentView()
}

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

let art = """
┈┈┈┈▕▔╱▔▔▔━▁
┈┈┈▕▔╱╱╱👁┈╲▂▔▔╲
┈┈▕▔╱╱╱╱💧▂▂▂▂▂▂▏
┈▕▔╱▕▕╱╱╱┈▽▽▽▽▽
▕▔╱┊┈╲╲╲╲▂△△△△
▔╱┊┈╱▕╲▂▂▂▂▂▂╱
╱┊┈╱┉▕┉┋╲┈
"""
