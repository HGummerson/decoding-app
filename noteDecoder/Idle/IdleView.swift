//
//  IdleView.swift
//  noteDecoder
//
//  Created by Holly Gummerson on 2024-11-28.
//

import SwiftUI

struct IdleView: View {
    @State private var path: [String] = []
    
    var body: some View {
            NavigationStack(path: $path) {
                VStack {
                    Button("Translate Your Notes") {
                        path.append("TextInputView") // Append a value to navigate
                    }
                }
                .navigationTitle("Hello Ava")
                .navigationDestination(for: String.self) { value in
                    if value == "TextInputView" {
                        TextInputView()
                    }
                }
            }
        }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            IdleView()
        }
    }
}
