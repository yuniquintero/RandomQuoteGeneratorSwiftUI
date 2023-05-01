//
//  HomeView.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 25/4/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack() {
            Spacer()
            VStack {
                Image(systemName: "quote.closing")
                    .foregroundColor(Color.orange)
                    .font(.system(size: 120))
                    .padding()
                Text("Random Quote Generator")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
            VStack {
                NavigationLink("Show Random Quote") {
                    RandomView(viewModel: RandomViewModel())
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .font(.title2.bold())
                .cornerRadius(10)
                .padding(30)
                NavigationLink("Show Categories") {
                    TagListView(viewModel: TagListViewModel())
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .font(.title2.bold())
                .cornerRadius(10)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
