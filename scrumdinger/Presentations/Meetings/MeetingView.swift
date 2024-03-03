//
//  ContentView.swift
//  scrumdinger
//
//  Created by vidio on 23/10/23.
//

import SwiftUI

struct MeetingView: View {
	
	@Binding
	var scrum: DailyScrum
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 16)
				.fill(scrum.theme.mainColor)
			VStack {
				ProgressView(value: 15, total: 60)
				HStack {
					VStack(alignment: .leading) {
						Text("Seconds Elapsed")
							.font(.caption)
						Label(
							String(100),
							systemImage: "hourglass.tophalf.fill"
						)
					}
					Spacer()
					VStack(alignment: HorizontalAlignment.trailing) {
						Text("Seconds Remaining")
							.font(Font.caption)
						Label(
							String(400),
							systemImage: "hourglass.bottomhalf.fill"
						)
					}
				}
				
				Circle()
					.strokeBorder(lineWidth: 24)
				
				HStack {
					Text("Speaker 1 of 3")
					Spacer()
					Button(action: {}) {
						Image(systemName: "forward.fill")
					}.accessibilityLabel("Next speaker")
				}
			}
		}
		.padding()
		.foregroundColor(scrum.theme.accentColor)
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
	MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
