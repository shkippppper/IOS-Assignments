//
//  HeaderView.swift
//  Assignment25
//
//  Created by Akaki Titberidze on 24.05.24.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: Variables
    
    var tasksCompleted: Int
    var tasksToComplete: Int
    var completeAllClicked: () -> Void
    var addNewTask: (String, Tag, Date) -> Void
    @State private var showAddTask = false
    @State private var newTaskName = ""
    @State private var newTaskTag: Tag = .plan
    @State private var newTaskDate = Date()
    
    // MARK: View
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("You have \(tasksToComplete) tasks to complete")
                    .foregroundStyle(.background)
                    .font(.system(size: 25))
                    .frame(maxWidth: 210, alignment: .leading)
                Spacer()
                ZStack() {
                    Image("userImage")
                        .padding(2)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.gradientPurple, .gradientPurpleLight]), startPoint: .top, endPoint: .bottom)
                        )
                        .clipShape(Ellipse()) // amas zomac unda
                    HStack(alignment: .bottom){
                        Spacer()
                        VStack {
                            Spacer()
                            Text("\(tasksCompleted)")
                                .font(.system(size: 10))
                                .foregroundStyle(.white)
                                .padding(5)
                                .background(.customOrange)
                                .clipShape(Circle())
                                .padding(.trailing, 6)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: 45, maxHeight: 60)
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 16) {
                Button(action: {
                    showAddTask.toggle()
                } ) {
                    Text("Add New Task")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(
                    LinearGradient(colors: [.gradientBlue, .gradientBlueLight], startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(10)
                
                Button(action: completeAllClicked ) {
                    Text("Complete All")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    LinearGradient(colors: [.gradientBlueLight, .gradientBlue], startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            
            if showAddTask {
                VStack(alignment: .leading, spacing: 10) {
                    TextField("", 
                              text: $newTaskName,
                              prompt: Text("Enter new task name").foregroundColor(.gray)
                    ).foregroundStyle(.customColorBackground)
                    
                    Picker("Pick TAG", selection: $newTaskTag) { // ams label rato ar chans?
                        Text("Plan").tag(Tag.plan)
                        Text("Backend").tag(Tag.backend)
                        Text("Front End").tag(Tag.frontend)
                        Text("Design").tag(Tag.design)
                    }

                    
                    DatePicker(selection: $newTaskDate, in: Date()..., displayedComponents: .date) {
                        Text("Select date")
                            .foregroundStyle(.gray)
                    }
                    .colorScheme(.dark)
                    .datePickerStyle(CompactDatePickerStyle())
                    
                    Button(action: {
                        addNewTask(newTaskName, newTaskTag, newTaskDate)
                        // reset
                        showAddTask = false
                        newTaskName = ""
                        newTaskTag = .plan
                        newTaskDate = Date()
                    } ) {
                        Text("Save")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(
                        LinearGradient(colors: [.gradientBlue, .gradientBlueLight], startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
                }
                .padding(16)
                .background(.customGray1)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ContentView()
}
