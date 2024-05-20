//
//  AuthorListView.swift
//  NavigationSplitAndStackTest
//
//  Created by Eric Kampman on 5/20/24.
//

import SwiftUI

struct AuthorListView: View {
	@State private var navigationPath = NavigationPath()
	@Environment(Library.self) var library

    var body: some View {
		NavigationStack(path: $navigationPath) {
			List(library.authors, id: \.self) { author in
				NavigationLink(author.name, value: author)
					.navigationDestination(for: Author.self) { author in
						BooksFilteredView(title: "Books by \(author.name)", books: library.booksForAuthor(author), navigationPath: $navigationPath)
					}
			}				
		}
    }
}

#Preview {
	var authors = [Author]()
    return AuthorListView()
}
