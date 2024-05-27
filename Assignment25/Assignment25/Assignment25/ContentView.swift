//
//  ContentView.swift
//  Assignment25
//
//  Created by Akaki Titberidze on 24.05.24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Variables
    @State var allTasks = tasksData
    @State private var percent: Double = 0
    
    
    // MARK: View
    
    var body: some View {
        
        ZStack {
            Color(.customBackground)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HeaderView(
                    tasksCompleted: getCompletedTasks(),
                    tasksToComplete: getIncompleteTasks(),
                    completeAllClicked: {
                        completeAllTasks()
                    },
                    addNewTask: { name, tag, date in
                        addNewTask(taskName: name, taskTag: tag, taskDate: date)
                    }
                )
                .padding(.bottom, 10)
                ScrollView {
                    DailyProgressView(
                        tasksCompleted: getCompletedTasks(),
                        totalTasks: getAllTasksCount(),
                        percent: $percent
                    )
                    .padding(.bottom, 10)
                    
                    TaskListView(
                        taskData: $allTasks,
                        updateData: updateData
                    )
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(16)
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.horizontal, 0)
        .onAppear {
            updateData()
        }
    }
    
    // MARK: Helper Functions
    
    func completeAllTasks() {
        for index in allTasks.indices {
            allTasks[index].isDone = true
        }
        updateData()
    }
    
    func addNewTask(taskName: String, taskTag: Tag, taskDate: Date) {
        let newTask = TaskModel(name: taskName, tag: taskTag, dueDate: taskDate, isDone: false)
        allTasks.append(newTask)
        updateData()
    }
    
    // MARK: Computed Properties
    
    func getIncompleteTasks() -> Int {
        allTasks.filter { !$0.isDone }.count
    }
    
    func getCompletedTasks() -> Int{
        allTasks.filter { $0.isDone }.count
    }
    
    func getAllTasksCount() -> Int {
        allTasks.count
    }
    
    func getCompletedPercent() -> Double {
        let total = Double(getAllTasksCount())
        return total == 0 ? 0 : Double(getCompletedTasks()) / total * 100
    }
    
    func updateData() {
        percent = getCompletedPercent()
        allTasks.sort { $0.isDone && !$1.isDone }
    }
    
}


#Preview {
    ContentView()
}

