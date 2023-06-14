//
//  ViewModel.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 5/4/23.
//

import Foundation
import package_models

final class RandomViewModel: ObservableObject {

    @Published var randomQuote: Quote?
    @Published var loadingState: LoadingState = .idle
    @Published var selectedTag: String
    @Published var fromFav = false

    private let provider: QuoteProvider

    init(provider: QuoteProvider = .init(), selectedTag: String = "", favQuote: Quote? = nil, fromFav : Bool = false) {
        self.provider = provider
        self.selectedTag = selectedTag
        self.randomQuote = favQuote
        self.fromFav = fromFav
    }

    func getRandomQuote() {
        loadingState = .loading
        provider.getRandomQuote(completion: { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.randomQuote = response.first
                    self.loadingState = .idle
                }
            case .failure(let error):
                self.loadingState = .error(error)
            }
        })
    }

    func getTagQuote() {
        loadingState = .loading
        provider.getTagQuote(tag: selectedTag.replacingOccurrences(of: " ", with: ""), completion: { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.randomQuote = response.first
                    self.loadingState = .idle
                }
            case .failure(let error):
                self.loadingState = .error(error)
            }
        })
    }

    func saveQuote(isFav: Bool = false) {
        if isFav {
            // remove fav
        } else {
            let json : [String:Any] = [
                "content": randomQuote?.content ?? "",
                "author": randomQuote?.author ?? "",
                "tags": randomQuote?.tags ?? [],
                "id": randomQuote?.id ?? ""
            ]

            if var favorites = (UserDefaults.standard.array(forKey: "favorites") as? [[String:Any]]) {
                favorites.append(json)
                UserDefaults.standard.set(favorites, forKey: "favorites")
            } else {
                UserDefaults.standard.set([json], forKey: "favorites")
            }
        }
    }
}

enum LoadingState: Equatable {
    static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading),
            (.idle, .idle),
            (.error, .error):
            return true
        default:
            return false
        }
    }

    case loading
    case idle
    case error(_ error: Error)
}
