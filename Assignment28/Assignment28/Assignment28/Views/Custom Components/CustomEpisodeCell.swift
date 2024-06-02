//
//  CustomEpisodeCell.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct CustomEpisodeCell: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(.system(size: 16, weight: .semibold))
            .padding()
            .background(.customGray)
            .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}
