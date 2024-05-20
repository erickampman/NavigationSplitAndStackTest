//
//  MainSplitView.swift
//  NavigationSplitAndStackTest
//
//  Created by Eric Kampman on 5/19/24.
//

import SwiftUI

struct MainSplitView: View {
	@Environment(Library.self) var library
    var body: some View {
		NavigationSplitView {
			NavigationLink("Books", value:library.books)
				.navigationDestination(for: [Book].self) { books in
					BookListView(books: books)
				}
			NavigationLink("Authors", value:library.authors)
				.navigationDestination(for: [Author].self) { authors in
					AuthorListView()
				}
		} detail: {
			Text("detail")
		}
    }
}

#Preview {
    MainSplitView()
}
