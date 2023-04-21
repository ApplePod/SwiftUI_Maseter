//
//  CircleGroupView.swift
//  Restart
//
//  Created by Herry on 2023/04/21.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    // MARK: - BODY
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .strokeBorder(ShapeColor.opacity(ShapeOpacity), lineWidth: 40 )
                .frame(width: 260, height: 260, alignment: .center)

            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            
        } //: ZSTACK
            
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
