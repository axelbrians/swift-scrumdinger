//
//  ThemeView.swift
//  scrumdinger
//
//  Created by vidio on 11/11/23.
//

import SwiftUI

struct ThemeView: View {
	let theme: Theme
	
    var body: some View {
		Text(theme.name)
			.padding(4)
			.frame(maxWidth: .infinity)
			.background(theme.mainColor)
			.foregroundStyle(theme.accentColor)
			.clipShape(RoundedRectangle(cornerRadius: 4.0))
    }
}

#Preview {
	ThemeView(theme: .buttercup)
}
