//
//  ContentView.swift
//  SwiftUIAsyncImage
//
//  Created by Herry on 2023/04/20.
//

import SwiftUI

extension Image {
    func imageModifire() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifire() -> some View {
        self
            .imageModifire()                .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}


struct ContentView: View {
    
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        // MARK: - 1. Basic
     
        // AsyncImage(url: URL(string: imageURL))
    
        // MARK: - 2. Scale
        
        // AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // MARK: - 3. Placeholder
        
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.imageModifire()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifire()
//
//        }
//        .padding(40)
  
        
        // MARK: -4. PHASE
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            // Success: The image successfully loaded.
//
//            // Failure: The image failed to load with an error.
//
//            // Empty: No image is loaded
//
//            if let image = phase.image {
//                image.imageModifire()
//            } else if phase.error != nil {
//                Image(systemName:  "ant.circle.fill").iconModifire()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifire()
//            }
//        }
//        .padding(40)
        
        // MARK: -5. ANIMATION
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            
            switch phase {
            case .success(let image):
                image.imageModifire()
//                  .transition(.move(edge: .bottom))
//                  .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifire()
            
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifire()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
