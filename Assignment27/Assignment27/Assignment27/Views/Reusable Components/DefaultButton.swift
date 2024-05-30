//
//  DefaultButton.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 30.05.24.
//

import SwiftUI

struct DefaultButton: View {
    var buttonTitle: String
    var isButtonClicked: () -> Void
    
    var body: some View {
        Button(action: {
            isButtonClicked()
        }) {
            Text(buttonTitle)
                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                .padding(.horizontal, 12)
                .background(.background)
                .foregroundStyle(.customPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .font(.system(size: 14, weight: .bold))
                .shadow(color: .customDropShadow, radius: 7, x: 3, y: 6)
        }
    }
}

