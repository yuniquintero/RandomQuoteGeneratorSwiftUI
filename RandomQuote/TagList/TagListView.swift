//
//  TagListView.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 19/4/23.
//

import SwiftUI

struct TagListView: View {
    @StateObject var viewModel: TagListViewModel

    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

    var body: some View {
        NavigationView {
            if viewModel.loadingState == .loading {
                Text("Loading...")
            } else if case .error(let error) = viewModel.loadingState {
                Text(error.localizedDescription)
            } else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.tagList) { tag in
                            TagCellView(name: tag.name)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.getTagList()
        }
    }
}

struct TagListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TagListViewModel()
        TagListView(viewModel: viewModel)
    }
}
