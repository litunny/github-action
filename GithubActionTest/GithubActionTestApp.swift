//
//  GithubActionTestApp.swift
//  GithubActionTest
//
//  Created by Itunu on 26/11/2021.
//

import SwiftUI

@main
struct GithubActionTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
