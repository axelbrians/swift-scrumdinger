//
//  DetailView.swift
//  scrumdinger
//
//  Created by vidio on 31/10/23.
//

import SwiftUI

struct DetailView: View {
	let scrum: DailyScrum
	
	@State
	private var isPresentingEditView = false
	
    var body: some View {
		List {
			Section(
				content: {
					NavigationLink(
						destination: MeetingView(),
						label: {
							Label(
								"Start Meeting",
								systemImage: "timer"
							)
							.font(.headline)
							.foregroundStyle(Color.accentColor)
						}
					)
					
					HStack {
						Label(
							"Length",
							systemImage: "clock"
						)
						Spacer()
						Text("\(scrum.lengthInMinutes) minutes")
							.font(.caption)
					}
					.accessibilityElement(children: .combine)
					
					HStack {
						Label(
							"Theme",
							systemImage: "paintpalette"
						)
						Spacer()
						Text(scrum.theme.name)
							.font(.caption)
							.padding(4)
							.foregroundStyle(Color(scrum.theme.accentColor))
							.background(scrum.theme.mainColor)
							.clipShape(RoundedRectangle(cornerRadius: 4))
					}
				},
				header: {
					Text("Meeting Info")
				}
			)
			
			Section(
				content: {
					ForEach(
						scrum.attendees,
						content: { attendee in
							Label(
								attendee.name,
								systemImage: "person"
							)
						}
					)
				},
				header: {
					Text("Attendees")
				}
			)
		}
		.navigationTitle(scrum.title)
		.toolbar {
			Button("Edit", action: { isPresentingEditView = true })
		}
		.sheet(
			isPresented: $isPresentingEditView,
			onDismiss: {
				isPresentingEditView = false
			},
			content: {
				NavigationStack {
					DetailEditView()
						.navigationTitle(scrum.title)
						.toolbar {
							ToolbarItem(
								placement: .cancellationAction
							) {
								Button("Cancel") {
									isPresentingEditView = false
								}
								.foregroundStyle(Color.red)
							}
							ToolbarItem(placement: .confirmationAction) {
								Button("Save") {
									isPresentingEditView = false
								}
								.foregroundStyle(Color.blue)
							}
						}
				}
			}
		)
    }
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationStack {
			DetailView(scrum: DailyScrum.sampleData[0])
		}
	}
}
