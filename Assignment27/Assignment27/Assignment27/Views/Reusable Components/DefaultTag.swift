//
//  DefaultTag.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 30.05.24.
//

import SwiftUI

struct DefaultTag: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundStyle(.primary)
            Spacer()
            Text(text)
                .foregroundColor(.primary)
                .font(.system(size: 12))
        }
        .padding(10)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .customDropShadow, radius: 7, x: 3, y: 6)
    }
}
