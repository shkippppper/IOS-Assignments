//
//  Assignment26App.swift
//  Assignment26
//
//  Created by Akaki Titberidze on 27.05.24.
//

import SwiftUI

@main
struct Assignment26App: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = ShopViewModel()
            ContentView(viewModel: viewModel)
        }
    }
}
