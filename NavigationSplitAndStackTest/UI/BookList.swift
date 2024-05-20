//
//  BookMainView.swift
//  NavigationSplitAndStackTest
//
//  Created by Eric Kampman on 5/19/24.
//

import SwiftUI

struct BookListView: View {
	@State private var navigationPath = NavigationPath()
	var books: [Book]
	
    var body: some View {
		NavigationStack(path: $navigationPath) {
			List(books, id: \.self) { book in
				NavigationLink(book.title, value: book)
			}
			.navigationDestination(for: Book.self) { book in
				
			}
		}
        Text("Book Main View")
    }
}

#Preview {
	var books = [Book]()
    return BookListView(books: books)
}
