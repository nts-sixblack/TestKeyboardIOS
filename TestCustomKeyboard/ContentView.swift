//
//  ContentView.swift
//  TestCustomKeyboard
//
//  Created by Thanh Sau on 24/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    
    let start = 0x1F600
    let end = 0x1F64F
    
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! 🤗 ")
            
            TextField("input text", text: $text)
            
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
