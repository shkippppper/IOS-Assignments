//
//  CheckoutDetailView.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import SwiftUI

struct CheckoutDetailView: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack(){
            Text(label)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.background)
            Spacer()
            Text(value)
                .font(.system(size: 16))
                .foregroundStyle(.background)

        }
        .padding(.vertical, 2)
    }
}
