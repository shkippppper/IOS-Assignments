//
//  ProgressBarView.swift
//  Assignment25
//
//  Created by Akaki Titberidze on 24.05.24.
//

import SwiftUI

struct ProgressBarView: View {
    
    // MARK: Variables
    
    var height: CGFloat
    var percent: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    
    // MARK: Views
    
    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let multiplier = width / 100
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: height, style: .continuous)
                    .frame(height: height)
                    .foregroundColor(foregroundColor)
                RoundedRectangle(cornerRadius: height, style: .continuous)
                    .frame(width: percent * multiplier, height: height)
                    .background(backgroundColor.clipShape(RoundedRectangle(cornerRadius: height, style: .continuous)))
                    .foregroundColor(.clear)
            }
        }
    }
}

