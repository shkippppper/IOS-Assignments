//
//  Assignment29App.swift
//  Assignment29
//
//  Created by Akaki Titberidze on 05.06.24.
//

import SwiftUI
import SwiftData

@main
struct Assignment29App: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: MovieDetailedSwiftData.self)

    }
}
