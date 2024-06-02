//
//  CustomLocationCell.swift
//  Assignment28
//
//  Created by Akaki Titberidze on 31.05.24.
//

import SwiftUI

struct CustomLocationCell: View {
    var name: String
    var type: String
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 18, weight: .bold))
            Spacer()
            VStack {
                Spacer()
                Text(type)
                    .font(.system(size: 16, weight: .light))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 30)
        .padding()
        .background(.customGray)
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

#Preview {
    CustomLocationCell(name: "Earth C123", type: "Planet")
}
