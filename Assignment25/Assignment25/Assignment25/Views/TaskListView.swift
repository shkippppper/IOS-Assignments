//
//  TaskListView.swift
//  Assignment25
//
//  Created by Akaki Titberidze on 24.05.24.
//

import Foundation
import SwiftUI

struct TaskListView: View {
    
    // MARK: Variables
    
    @Binding var taskData: [TaskModel]
    let updateData: () -> Void
    
    // MARK: View
    
    var body: some View {
        Section {
            if taskData.filter({ $0.isDone }).count != 0 {
                CustomHeaderTextView(title: "Completed Tasks")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color(.customBackground))
            }
            
            ForEach(taskData.filter { $0.isDone }, id: \.hashValue) { task in
                TaskCell(
                    taskName: task.name,
                    dueDate: task.dueDate,
                    tag: task.tag,
                    isComplete: task.isDone,
                    buttonClicked: {
                        if let index = taskData.firstIndex(where: { $0.hashValue == task.hashValue }) {
                            taskData[index].isDone.toggle()
                        }
                        updateData()
                    }
                )
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
            }
            .listStyle(PlainListStyle())
            .listRowBackground(Color(.customGray2))
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        Section {
            if taskData.filter({ $0.isDone }).count != taskData.count {
                CustomHeaderTextView(title: "Incomplete Tasks")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color(.customBackground))
            }
            
            ForEach(taskData.filter { !$0.isDone }, id: \.hashValue) {task in
                TaskCell(
                    taskName: task.name,
                    dueDate: task.dueDate,
                    tag: task.tag,
                    isComplete: task.isDone,
                    buttonClicked: {
                        if let index = taskData.firstIndex(where: { $0.hashValue == task.hashValue }) {
                            taskData[index].isDone.toggle()
                        }
                        updateData()
                    }
                )
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
            }
            .listStyle(PlainListStyle())
            .listRowBackground(Color(.customGray2))
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    ContentView()
}
