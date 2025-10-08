//
//  ToDo_Viper_1_0App.swift
//  ToDo_Viper_1.0
//
//  Created by Igor Polousov on 08.10.2025.
//

import SwiftUI

@main
struct ToDo_Viper_1_0App: App {
    
    let provider = TodosProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(provider)
        }
    }
}
