//
//  HomeView.swift
//  noteDecoder
//
//  Created by Holly Gummerson on 2024-11-28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Hello Ava!")
                .font(.largeTitle)
                .padding()
                .accessibilityIdentifier("HomeTitle")
            
            NavigationLink(destination: TextInputView()) {
                Text("Begin Decoding")
                    .font(.title)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
            }
            .accessibilityIdentifier("GoToDecoderButton")
            .padding(.top, 20)
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView() // Initial screen that leads to the TextInputView
        }
    }
}
