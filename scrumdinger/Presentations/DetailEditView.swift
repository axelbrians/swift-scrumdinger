//
//  EditView.swift
//  scrumdinger
//
//  Created by vidio on 09/11/23.
//

import SwiftUI

struct DetailEditView: View {
	@Binding
	var scrum: DailyScrum
	
	var body: some View {
		Form {
			MeetingInfoSection(scrum: $scrum)
			AttendeesSection(scrum: $scrum)
		}
	}
}

private struct MeetingInfoSection: View {
	
	@Binding
	var scrum: DailyScrum
	
	var body: some View {
		Section(
			content: {
				TextField(
					"Title",
					text: $scrum.title
				)
				HStack {
					Slider(
						value: $scrum.lengthInMinutesAsDouble,
						in: 5...30,
						step: 1
					) {
						Text("Length")
					}
					.accessibilityValue("\(scrum.lengthInMinutes) minutes")
					
					Spacer()
					Text("\(scrum.lengthInMinutes) minutes")
						.accessibilityHidden(true)
				}
				ThemePicker(selection: $scrum.theme)
			},
			header: {
				Text("Meeting Info")
					.font(.subheadline)
			}
		)
	}
}

private struct AttendeesSection: View {
	
	@Binding
	var scrum: DailyScrum
	
	@State
	private var newAttendeeName: String = ""
	
	var body: some View {
		Section(
			header: Text("Attendees")
				.font(.subheadline)
		) {
			ForEach(scrum.attendees) { attendee in
				Text("\(attendee.name)")
			}
			.onDelete(
				perform: { indexSet in
					scrum.attendees.remove(atOffsets: indexSet)
				}
			)
			HStack {
				TextField(
					"New Attendee",
					text: $newAttendeeName
				)
				Button(
					action: {
						withAnimation {
							let newAttendee = DailyScrum.Attendee(name: newAttendeeName)
						
							scrum.attendees.append(newAttendee)
							newAttendeeName = ""
						}
					},
					label: {
						Image(systemName: "plus.circle.fill")
							.accessibilityLabel("Add attendee")
					}
				).disabled(newAttendeeName.isEmpty)
			}
		}
	}
}

struct DetailEditView_Previews: PreviewProvider {
	static var previews: some View {
		DetailEditView(scrum: .constant(.emptyScrum))
	}
}
