//
//  TaskModel.swift
//  Assignment25
//
//  Created by Akaki Titberidze on 24.05.24.
//

import SwiftUI

struct TaskModel: Hashable {
    var name: String
    var tag: Tag
    var dueDate: Date
    var isDone: Bool
}

enum Tag: CaseIterable{
    case backend, frontend, design, plan
    
    var color: Color {
        switch self {
        case .backend:
            return Color.customTagBackend
        case .frontend:
            return Color.customTagFrontend
        case .design:
            return Color.customTagDesign
        case .plan:
            return Color.customTagPlan
        }
    }
}
