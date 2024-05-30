//
//  Assignment27App.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 29.05.24.
//

import SwiftUI

@main
struct Assignment27App: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = TravelAppViewModel()
            ContentView(viewModel: viewModel)
        }
    }
}
