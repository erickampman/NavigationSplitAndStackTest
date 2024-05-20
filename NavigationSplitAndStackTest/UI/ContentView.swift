//
//  ContentView.swift
//  NavigationSplitAndStackTest
//
//  Created by Eric Kampman on 5/19/24.
//

import SwiftUI

struct ContentView: View {
	@State private var library = Library()
	
    var body: some View {
        VStack {
			MainSplitView()
				.environment(library)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
