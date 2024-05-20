//
//  BookView.swift
//  NavigationSplitAndStackTest
//
//  Created by Eric Kampman on 5/19/24.
//

import SwiftUI

struct BookView: View {
	@Environment(Library.self) var library
	var book: Book
	@Binding var navigationPath: NavigationPath
	let booksByAuthor = "booksByAuthor"
	let booksByPublisher = "booksByPublisher"
	let bookSynopsis = "bookSynopsis"
    var body: some View {
		VStack {
			HStack {
				Text("\(book.title)")
					.font(.title)
				NavigationLink("Synopsis", value: book.synopsis)
			}
			HStack {
				Text("\(book.author)")
				NavigationLink("Other titles by \(book.author.name)", value: booksByAuthor)
			}
			HStack {
				Text("\(book.publisher)")
				NavigationLink("Other titles by publisher \(book.publisher.name)", value: booksByPublisher)
			}
		}
		.navigationDestination(for: String.self) { str in
			switch str {
			case booksByAuthor:
				BooksFilteredView(title: "Books by \(book.author.name)", books: library.booksForAuthor(book.author), navigationPath: $navigationPath)
			case booksByPublisher:
				BooksFilteredView(title: "Books by publisher \(book.publisher.name)", books: library.booksForPublisher(book.publisher), navigationPath: $navigationPath)
			default:
				Text("INVALID STRING")
			}
		}
		.navigationDestination(for: Synopsis.self) { synopsis in
			BookSynopsisView(title: book.title, synopsis: book.synopsis, navigationPath: $navigationPath)
		}
    }
}

#Preview {
	let book = Book(title: "Foobars", author: Author(name: "Foo Bar"), publisher: Publisher(name: "BarFoos"))
	@State var navigationPath = NavigationPath()
	return BookView(book: book, navigationPath: $navigationPath)
}
