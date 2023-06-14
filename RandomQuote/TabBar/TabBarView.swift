//
//  TabBarView.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 6/6/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }

            FavListView(viewModel: FavListViewModel())
                        .tabItem {
                            Label("Favorites", systemImage: "list.star")
                        }
                }
        .accentColor(Color.orange)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
                   .environmentObject(RandomViewModel())
    }
}
