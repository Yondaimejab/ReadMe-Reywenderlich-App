//
//  ReadMeApp.swift
//  ReadMe
//
//  Created by joel Alcantara on 6/1/22.
//

import SwiftUI

@main
struct ReadMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Library())
        }
    }
}
