//
//  ContentView.swift
//  Restart
//
//  Created by Herry on 2023/04/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            
            if isOnboardingViewActive {
                OnboardingViews()
            } else {
                HomeView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
