//
//  Data.swift
//  NavigationSplitAndStackTest
//
//  Created by Eric Kampman on 5/19/24.
//

import Foundation
import Observation

@Observable
class Book: Equatable, Hashable {
	
	static func == (lhs: Book, rhs: Book) -> Bool {
		lhs.title == rhs.title
	}
	func hash(into hasher: inout Hasher) {
		hasher.combine(title)
	}
	
	var title: String
	var author: Author
	var publisher: Publisher
	var synopsis = Synopsis(text: "")
	
	init(title: String, author: Author, publisher: Publisher) {
		self.title = title
		self.author = author
		self.publisher = publisher
	}
}

@Observable
class Author: Equatable, Hashable {
	static func == (lhs: Author, rhs: Author) -> Bool {
		lhs.name == rhs.name
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(name)
	}

	var name: String
	
	init(name: String) {
		self.name = name
	}
}

@Observable
class Publisher: Identifiable, Hashable {
	static func == (lhs: Publisher, rhs: Publisher) -> Bool {
		lhs.name == rhs.name
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(name)
	}
	
	var name: String
	
	var id: String {
		name
	}
	init(name: String) {
		self.name = name
	}
}

@Observable
class Synopsis: Identifiable, Hashable {
	
	static func == (lhs: Synopsis, rhs: Synopsis) -> Bool {
		lhs.text == rhs.text
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(text)
	}
	
	var text: String
//	var books: [Book]?
	
	var id: String {
		text
	}
	init(text: String) {
		self.text = text
//		self.books = books
	}

}

@Observable
class Library {
	var books = [Book]()
	
	init() {
		setupData()
	}
	func setupData() {
		let pub1 = Publisher(name: "Publisher 1")
		let pub2 = Publisher(name: "Publisher 2")
		
		let authorJV = Author(name: "Jack Vance")
		let authorMC = Author(name: "Michael Connelly")
		let authorUL = Author(name: "Ursula LeGuin")
		
		let book1 = Book(title: "Araminta Station", author: authorJV, publisher: pub1)
		let book2 = Book(title: "Ecce and Old Earth", author: authorJV, publisher: pub1)
		let book3 = Book(title: "Left Hand of Darkness", author: authorUL, publisher: pub2)
		let book4 = Book(title: "Concrete Blond", author: authorMC, publisher: pub2)
		let book5 = Book(title: "The Black Echo", author: authorMC, publisher: pub1)
		
		book1.synopsis = Synopsis(text: "Planetary Charter undermined by bad actors.")
		book2.synopsis = Synopsis(text: "Looking for a missing planetary charter and grant.")
		book3.synopsis = Synopsis(text: "I think it was about hermaphroditic people...")
		book4.synopsis = Synopsis(text: "Bosch is in trouble -- is the Dollmaker still alive?")
		book5.synopsis = Synopsis(text: "Why is a tunnel rat dead in LA?")

		books.append(book1)
		books.append(book2)
		books.append(book3)
		books.append(book4)
		books.append(book5)
	}
	
	var authors: [Author] {
		var set = Set<Author>()
		
		for book in books {
			set.insert(book.author)
		}
		
		return Array(set)
	}
	
	var publishers: [Publisher] {
		var set = Set<Publisher>()
		
		for book in books {
			set.insert(book.publisher)
		}
		
		return Array(set)
	}
	
	func booksForAuthor(_ author: Author) -> [Book] {
		return books.filter  { $0.author == author }
	}
	
	func booksForPublisher(_ publisher: Publisher) -> [Book] {
		return books.filter  { $0.publisher == publisher }
	}
	
}
	
