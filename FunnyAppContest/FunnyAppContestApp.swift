//
//  FunnyAppContestApp.swift
//  FunnyAppContest
//
//  Created by 松岡奈央 on 2023/01/08.
//

import SwiftUI

@main
struct FunnyAppContestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
