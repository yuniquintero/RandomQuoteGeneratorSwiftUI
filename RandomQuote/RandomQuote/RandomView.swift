//
//  ContentView.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 5/4/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct RandomView: View {
    @StateObject var viewModel: RandomViewModel
    @State private var likePressed = false
    @State private var likeIcon = "star"

    var body: some View {
        VStack {
            Spacer()
            VStack {
                if viewModel.loadingState == .loading {
                    Text("Loading...")
                } else if case .error(let error) = viewModel.loadingState {
                    Text(error.localizedDescription)
                } else {
                    Text("\"" + (viewModel.randomQuote?.content ?? "") + "\"")
                        .italic()
                        .font(.system(size: 28))
                        .padding()
                    Text(viewModel.randomQuote?.author ?? "")
                        .font(.system(size: 18))
                    .padding()
                    VStack {
                        ForEach(viewModel.randomQuote?.tags ?? [], id: \.self) { tag in
                                        Text(tag)
                                .foregroundColor(.orange)
                                .font(.system(size: 14))
                                .bold()
                                    }
                    }
                    .padding(8)
                    Image(systemName: "tag.fill")
                        .foregroundColor(Color.orange)
                        .font(.system(size: 20))
                }
            }
            .padding()
            Spacer()
            HStack(spacing: 30) {
                Button(action: {
                    likePressed.toggle()
                    likeIcon = likePressed ? "star.fill" : "star"
                    viewModel.saveQuote()
                }, label: {
                    Image(systemName: likeIcon)
                        .foregroundColor(Color.orange)
                        .font(.system(size: 40))
                })
                Button(action: {
                    if viewModel.selectedTag == "" {
                        viewModel.getRandomQuote()
                    } else {
                        viewModel.getTagQuote()
                    }
                    likePressed = false
                    likeIcon = "star"
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .foregroundColor(Color.orange)
                        .font(.system(size: 40))
                })
                ShareLink(item: "\"\(viewModel.randomQuote?.content ?? "")\" \(viewModel.randomQuote?.author ?? "")") {
                    Image(systemName: "square.and.arrow.up.fill")
                        .foregroundColor(Color.orange)
                        .font(.system(size: 34))
                }
            }
            Spacer()
        }
        .onAppear {
            if viewModel.selectedTag == "" {
                viewModel.getRandomQuote()
            } else {
                viewModel.getTagQuote()
            }
        }
        .navigationBarTitle(viewModel.selectedTag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RandomViewModel()
        RandomView(viewModel: viewModel)
    }
}
