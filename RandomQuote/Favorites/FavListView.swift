//
//  FavListSwift.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 6/6/23.
//

import SwiftUI
import package_models
import UIKit

struct FavListView: View {
    @StateObject var viewModel: FavListViewModel

    var body: some View {
        List(viewModel.getQuotes()) { quote in
            NavigationLink(quote.content) {
                //RandomView(viewModel: RandomViewModel(selectedTag: name))
            }
        }
    }
}

struct FavListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FavListViewModel()
        FavListView(viewModel: viewModel)
    }
}
