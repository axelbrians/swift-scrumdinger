//
//  scrumdingerApp.swift
//  scrumdinger
//
//  Created by vidio on 23/10/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
	@State
	private var scrums = DailyScrum.sampleData
	
	@State
	private var counter = 0
	
    var body: some Scene {
        WindowGroup {
			ScrumsView(scrums: $scrums)	
			
//			DetailView()
			
//			HStack(alignment: .center) {
//				DecrementButtonView(counter: $counter)
//				CounterTextView(counter: counter)
//				IncrementButtonView(counter: $counter)
//			}
        }
    }
}


struct DecrementButtonView: View {
	@Binding
	var counter: Int
	
	var body: some View {
		Button("-", action: { counter = counter - 1 })
	}
}

struct IncrementButtonView: View {
	
	@Binding
	var counter: Int
	
	var body: some View {
		Button("+", action: { counter = counter + 1})
	}
}

struct CounterTextView: View {
	var counter: Int
	
	var body: some View {
		Text(verbatim: String(counter))
	}
}
