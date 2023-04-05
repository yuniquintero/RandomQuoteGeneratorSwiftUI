//
//  ViewModel.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 5/4/23.
//

import Foundation
import package_models

final class ViewModel: ObservableObject {

    @Published var randomQuote: Quote?
    @Published var loadingState: LoadingState = .idle

    private let provider: QuoteProvider

    init(provider: QuoteProvider = .init()) {
        self.provider = provider
    }

    func getData() {
        loadingState = .loading
        provider.getRandomQuote(completion: { [weak self] result in
            print("SOS", result)
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.randomQuote = response
                    self.loadingState = .idle
                }
            case .failure(let error):
                self.loadingState = .error(error)
            }
        })
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
