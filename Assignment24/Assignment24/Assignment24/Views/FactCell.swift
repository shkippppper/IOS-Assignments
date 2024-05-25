//
//  FactCell.swift
//  Assignment24
//
//  Created by Akaki Titberidze on 23.05.24.
//

import SwiftUI

struct FactCell: View {
    var factMain: String
    var factSecondary: String
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 18){
                Image("postIcon")
                    .frame(maxWidth: 24, maxHeight: 24)
                    .padding(8)
                    .background(.customColorBlue)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text(factMain)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .frame(maxWidth: 280)
                    Text(factSecondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .frame(maxWidth: 260)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .padding(EdgeInsets(top: 14, leading: 0, bottom: 6, trailing: 14))
            Divider()
                .background(Color.white)
        }
        .frame(maxWidth: .infinity)
    }
}

