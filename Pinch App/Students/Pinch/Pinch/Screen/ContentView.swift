//
//  ContentView.swift
//  Pinch
//
//  Created by Herry on 2023/04/22.
//

import SwiftUI

struct ContentView: View {
 
    //MARK: - PROPERTY
    
    @State private var isAnimationg: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
        
    // MARK: - FUNCTION
    
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
        
    // MARK: - CONTENT
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                // MARK: - Page Image
                
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimationg ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                
                // MARK: - 1. Tap Gesture
                    .onTapGesture(count: 2) {
                        if imageScale == 1  {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            withAnimation(.spring()) {
                                resetImageState()
                            }
                        }
                    }
                // MARK: - 2. Drag Gesture
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            }
                    
                    .onEnded { _ in
                        if imageScale <= 1 {
                            withAnimation(.spring()) {
                                resetImageState()
                                }
                            }
                        }
                    )
            } //: Zstack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimationg = true
                }
            }
            
            .overlay (
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.top, 30)
                    .padding(.horizontal),
            alignment: .top

            )
            
        }//: Navigation
        .navigationViewStyle(.stack)
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
