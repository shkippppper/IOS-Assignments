//
//  LargeCardView.swift
//  Assignment24
//
//  Created by Akaki Titberidze on 23.05.24.
//

import SwiftUI

struct LargeCardView: View {
    
    // MARK: Variables

    var color: Color
    var secondaryColor: Color
    var icon: String
    var text: String
    var largeImage: String
    @Binding var largeText: String
    var buttonClicked: () -> Void
    
    // MARK: Layout & Styling

    var body: some View {
        ZStack(alignment: .topLeading){
            Color(color)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(largeImage)
                }
            }
            VStack(alignment: .leading) {
                Button(action: {
                    buttonClicked()
                }){
                    Image(icon)
                        .frame(maxWidth: 20, maxHeight: 20)
                        .padding(6)
                        .background(Color(secondaryColor))
                        .clipShape(Circle())
                }
                Text(text)
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                Spacer()
                Text(largeText)
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 33, trailing: 0))
                    .fontWeight(.bold)
                    .frame(maxWidth: 120, alignment: .leading)
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(18)
    }
}
