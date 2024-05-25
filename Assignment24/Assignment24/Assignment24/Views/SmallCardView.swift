//
//  SmallCardView.swift
//  Assignment24
//
//  Created by Akaki Titberidze on 23.05.24.
//

import SwiftUI

struct SmallCardView: View {
    
    // MARK: Variables
    
    @Binding var color: Color
    @Binding var secondaryColor: Color
    var icon: String
    var text: String
    var largeImage: String
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
                    .frame(maxWidth: 80, alignment: .leading)
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(18)
    }
}
