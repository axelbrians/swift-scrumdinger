//
//  ScrumsView.swift
//  scrumdinger
//
//  Created by vidio on 26/10/23.
//

import SwiftUI

struct ScrumsView: View {
	let scrums: [DailyScrum]
	
    var body: some View {
		NavigationStack {
			List(scrums) { scrum in
				NavigationLink(
					destination: DetailView(scrum: scrum)
				) {
					CardView(scrum: scrum)
				}
				.listRowBackground(scrum.theme.mainColor)
			}
			.navigationTitle("Daily Scrum")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar(content: {
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
					Image(systemName: "plus")
				})
				.accessibilityLabel("Add new scrum")
			})
		}
    }
}

struct ScrumsView_Previews: PreviewProvider {
	static var previews: some View {
		ScrumsView(scrums: DailyScrum.sampleData)
	}
}
