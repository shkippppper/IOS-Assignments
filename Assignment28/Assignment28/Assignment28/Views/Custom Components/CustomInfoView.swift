//
//  CustomInfoView.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct CustomInfoView: View {
    var leadingText: String
    var trailingText: String
    var body: some View {
        HStack {
            Text(leadingText)
                .font(.system(size: 18, weight: .light))
            Spacer()
            Text(trailingText)
                .font(.system(size: 18, weight: .bold))
                .lineLimit(1)
        }
        .padding(10)
        .background(Color.customGray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CustomInfoView(leadingText: "Type:", trailingText: "Unknown")
}
