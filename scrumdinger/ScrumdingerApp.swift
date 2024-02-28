//
//  scrumdingerApp.swift
//  scrumdinger
//
//  Created by vidio on 23/10/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
			ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
