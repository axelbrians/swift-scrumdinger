//
//  MeetingHeaderView.swift
//  scrumdinger
//
//  Created by vidio on 03/03/24.
//

import SwiftUI

struct MeetingHeaderView: View {
	
	let secondsElapsed: Int
	let secondsRemaining: Int
	
	private var totalSeconds: Int {
		secondsElapsed + secondsRemaining
	}
	
	private var progress: Double {
		guard totalSeconds > 0 else { return 1 }
		return Double(secondsElapsed) / Double(totalSeconds)
	}
	
	private var minutesRemaining: Int {
		secondsRemaining / 60
	}
	
	var body: some View {
		VStack {
			ProgressView(value: progress)
			HStack {
				VStack(alignment: .leading) {
					Text("Seconds Elapsed")
						.font(.caption)
					Label(
						String(secondsElapsed),
						systemImage: "hourglass.tophalf.fill"
					)
				}
				Spacer()
				VStack(alignment: HorizontalAlignment.trailing) {
					Text("Seconds Remaining")
						.font(Font.caption)
					Label(
						String(secondsRemaining),
						systemImage: "hourglass.bottomhalf.fill"
					)
				}
			}
		}
		.accessibilityElement(
			children: AccessibilityChildBehavior.ignore
		)
		.accessibilityLabel("Time remaining")
		.accessibilityValue("\(minutesRemaining) minutes")
	}
}

#Preview {
	MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 100)
		.previewLayout(.sizeThatFits)
}
