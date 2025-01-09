//
//  ContentView.swift
//  noteDecoder
//
//  Created by Holly Gummerson on 2024-11-28.
//

import SwiftUI

struct TextInputView: View {
    
    // State variable to store the text
    @State private var text = "Paste your secrets here..."
    
    var body: some View {
        VStack {
            // TextEditor for pasting and typing text
            TextEditor(text: $text)
                .accessibilityIdentifier("TextEditor")
                .frame(height: 200)
                .border(Color.gray, width: 1)
                .cornerRadius(8)
                .padding()
            
            // Button to begin translation
            Button(action: translateText) {
                Text("Begin Translation")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(false)
    }
    
    // Function to paste text from the clipboard
    func translateText() {
        let newText = TextParser().parse(text)
        text = newText
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextInputView()
        }
    }
}
