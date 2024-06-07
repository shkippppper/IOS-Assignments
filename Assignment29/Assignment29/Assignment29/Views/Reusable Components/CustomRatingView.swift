//
//  CustomRatingView.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 06.06.24.
//

import SwiftUI

struct CustomRatingView: View {
    var rating: Double
    var smallSize: Bool = false
    
    var body: some View {
        HStack(spacing: smallSize ? 2 : 4) {
            ForEach(0..<5) { index in
                if rating > 4.6 {
                    Image(systemName: "star.fill")
                } else if Double(index + 1) <= rating {
                    Image(systemName: "star.fill")
                } else if Double(index) + 0.5 <= rating {
                    Image(systemName: "star.leadinghalf.filled")
                } else {
                    Image(systemName: "star")
                }
            }
            .font(.system(size: smallSize ? 12 : 20))
            .foregroundColor(.customSecondary)
        }
        .background(.black)
        if smallSize {
            Text("s")
            
        }
    }
}

#Preview {
    VStack {
        CustomRatingView(rating: 3.1)
        CustomRatingView(rating: 4.6, smallSize: true)
    }
}
