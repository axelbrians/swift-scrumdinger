//
//  Theme.swift
//  scrumdinger
//
//  Created by vidio on 25/10/23.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
	case bubblegum
	case buttercup
	case indigo
	case lavender
	case magenta
	case navy
	case orange
	case oxblood
	case periwinkle
	case poppy
	case purple
	case seafoam
	case sky
	case tan
	case teal
	case yellow
	
	var accentColor: Color {
		switch self {
		case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, 
				.poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
		case .indigo, .magenta, .navy, .oxblood, .purple: return .white
		}
	}
	
	var mainColor: Color {
		return Color(rawValue)
	}
	
	var name: String {
		return rawValue.capitalized
	}
	
	var id: String {
		return name
	}
}
