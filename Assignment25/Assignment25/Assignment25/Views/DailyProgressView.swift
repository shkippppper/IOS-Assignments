//
//  DailyProgressView.swift
//  Assignment25
//
//  Created by Akaki Titberidze on 24.05.24.
//

import SwiftUI

struct DailyProgressView: View {
    
    // MARK: Variables
    
    var tasksCompleted: Int
    var totalTasks: Int
    @Binding var percent: Double
    
    // MARK: View
    
    var body: some View {
        VStack(spacing: 0) {
            CustomHeaderTextView(title: "Progress")
            VStack(spacing: 0) {
                HStack {
                    Text("Daily Task")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.background)
                        .padding(.bottom, 10)
                    Spacer()
                }
                HStack {
                    Text("\(tasksCompleted)/\(totalTasks) Task Completed")
                        .font(.system(size: 16, weight: .light))
                        .foregroundStyle(.background)
                    Spacer()
                }
                Spacer()
                HStack(spacing: 0) {
                    Text(percent == 100 ? "Great Job!" : "Keep Working")
                        .font(.system(size: 14, weight: .ultraLight))
                        .foregroundStyle(percent == 100 ? Color.green : Color.customColorBackground)
                    Spacer()
                    Text("\(Int(percent))%")
                        .padding(.trailing, 18)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(percent == 100 ? Color.green : Color.customColorBackground)
                }
                ProgressBarView(height: 18, percent: CGFloat(percent), backgroundColor: .customProgressMain, foregroundColor: .customProgressMain.opacity(0.4))
                    .animation(.bouncy(), value: percent)
                    .frame(maxWidth: .infinity)
            }
            .frame(width: .infinity, height: 100)
            .padding(16)
            .background(.customGray1)
            .cornerRadius(8)
        }
    }
}


#Preview {
    ContentView()
}
