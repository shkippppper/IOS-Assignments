//
//  CustomHeaderTextView.swift
//  Assignment25
//
//  Created by Akaki Titberidze on 24.05.24.
//

import SwiftUI

struct CustomHeaderTextView: View {
    
    // MARK: Variables
    
    var title: String
    
    // MARK: View
    
    var body: some View {
        Text(title)
            .font(.system(size: 22))
            .foregroundStyle(.background)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
    }
}

