//
//  BooksByAuthorView.swift
//  NavigationSplitAndStackTest
//
//  Created by Eric Kampman on 5/20/24.
//

import SwiftUI

struct BooksFilteredView: View {
	var title: String
	var books: [Book]
	@Binding var navigationPath: NavigationPath

	var body: some View {
		VStack {
			Text(title)
				.font(.title)
			ForEach(books, id: \.self) { book in
				HStack {
					Text(book.title)
					NavigationLink("Synopsis", value: book.synopsis)
						.navigationDestination(for: Synopsis.self) { synopsis in
							BookSynopsisView(title: book.title, synopsis: synopsis, navigationPath: $navigationPath)
						}
				}
			}
		}
    }
}

#Preview {
	var title = "Preview Title"
	var books = [Book]()
	@State var navigationPath = NavigationPath()
	return BooksFilteredView(title: title, books: books, navigationPath: $navigationPath)
}
