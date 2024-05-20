//
//  BookSynopsisView.swift
//  NavigationSplitAndStackTest
//
//  Created by Eric Kampman on 5/20/24.
//

import SwiftUI

struct BookSynopsisView: View {
	var title: String
	var synopsis: Synopsis
	@Binding var navigationPath: NavigationPath

    var body: some View {
		VStack {
			Text(title)
				.font(.title)
			Text(synopsis.text)
			Button {
				navigationPath.removeLast()
			} label: {
				Image(systemName: "arrow.left")
			}
		}
    }
}

#Preview {
	let title = "Synopsis Title"
	let synopsis = Synopsis(text: "The book's synopisi")
	@State var navigationPath = NavigationPath()

	return BookSynopsisView(title: title, synopsis: synopsis, navigationPath: $navigationPath)
}
