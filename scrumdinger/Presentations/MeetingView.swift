//
//  ContentView.swift
//  scrumdinger
//
//  Created by vidio on 23/10/23.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
		VStack {
			ProgressView(value: 10, total: 15)
			HStack {
				VStack(alignment: .leading) {
					Text("Seconds Elapsed")
						.font(.caption)
					Label(
						"300",
						systemImage: "hourglass.tophalf.fill"
					)
				}
				Spacer()
				VStack(alignment: HorizontalAlignment.trailing) {
					Text("Seconds Remaining")
						.font(Font.caption)
					Label(
						"600",
						systemImage: "hourglass.bottomhalf.fill"
					)
				}
			}
			.accessibilityElement(
				children: AccessibilityChildBehavior.ignore
			)
			.accessibilityLabel("Time remaining")
			.accessibilityValue("10 minutes")
			
			Circle()
				.strokeBorder(lineWidth: 24)
			
			HStack {
				Text("Speaker 1 of 3")
				Spacer()
				Button(action: {}) {
					Image(systemName: "forward.fill")
				}.accessibilityLabel("Next speaker")
			}
			
			VStack {
				Text("Inventory")
					.font(.title)
				HStack {
					Label("Paperclips", systemImage: "paperclip.circle.fill")
					Text("3")
				}
			}
		}
		.padding()
    }
}

#Preview {
    MeetingView()
}
