//
//  CardView.swift
//  scrumdinger
//
//  Created by vidio on 25/10/23.
//

import SwiftUI

struct CardView: View {
	let scrum: DailyScrum
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(scrum.title)
				.font(.headline)
				.accessibilityAddTraits(.isHeader)
			Spacer()
			
			HStack {
				Label(
					"\(scrum.attendees.count)",
					systemImage: "person.3"
				)
				.accessibilityLabel("\(scrum.attendees.count) attendees")
				Spacer()
				Label(
					"\(scrum.lengthInMinutes)",
					systemImage: "clock"
				)
				.labelStyle(.trailingIcon)
				.accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
			}
			.font(.caption)
		}
		.padding()
		.foregroundStyle(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		let scrum = DailyScrum.sampleData[0]
		return CardView(scrum: scrum)
			.background(scrum.theme.mainColor)
			.previewLayout(.fixed(width: 400, height: 60))
	}
}
