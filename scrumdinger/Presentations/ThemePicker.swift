//
//  ThemePicker.swift
//  scrumdinger
//
//  Created by vidio on 11/11/23.
//

import SwiftUI

struct ThemePicker: View {
	@Binding
	var selection: Theme
	
    var body: some View {
		Picker("Theme", selection: $selection) {
			ForEach(Theme.allCases) { theme in
				ThemeView(theme: theme)
					.tag(theme)
			}
			ThemeView(theme: Theme.indigo)
				.tag("Private indigo")
		}
		.pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
	static var previews: some View {
		ThemePicker(selection: .constant(.bubblegum))
	}
}
