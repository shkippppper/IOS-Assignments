//
//  TaskCell.swift
//  Assignment25
//
//  Created by Akaki Titberidze on 24.05.24.
//

import SwiftUI

struct TaskCell: View {
    
    // MARK: Variables
    
    var taskName: String
    var dueDate: Date
    var tag: Tag
    var isComplete: Bool
    var buttonClicked: () -> Void
    
    // MARK: View
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 15, height: .infinity)
                .foregroundColor(tag.color)
            VStack(alignment: .leading, spacing: 5) {
                Text(taskName)
                    .font(.system(size: 16))
                    .foregroundStyle(.background)
                HStack(spacing: 8) {
                    Image("todoIcon")
                        .renderingMode(.template)
                        .foregroundStyle(.background)
                    Text(dueDate, style: .date)
                        .font(.system(size: 14, weight: .light))
                        .foregroundStyle(.background)
                        .frame(alignment: .leading)
                }
            }
            .padding(.leading, 6)
            Spacer()
            Button(action: buttonClicked) {
                ZStack {
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(isComplete ? .customProgressMain : .customGray2 )
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(isComplete ? .customColorBackground : .customProgressMain, lineWidth: 2)
                        )
                    if isComplete {
                        Image("checkMarkIcon")
                            .renderingMode(.template)
                            .foregroundStyle(.background)
                    }
                }
            }
            .padding(.trailing, 12)
        }
        .frame(height: 80)
        .background(Color.customGray2)
        .cornerRadius(8)
        .padding(.bottom, 10)
        
    }
}

#Preview {
    ContentView()
}
