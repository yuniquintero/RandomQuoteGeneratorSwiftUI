//
//  TagListViewModel.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 1/5/23.
//

import Foundation
import package_models

final class TagListViewModel: ObservableObject {
    @Published var tagList: [Tag] = []
    @Published var loadingState: LoadingState = .idle

    private let provider: QuoteProvider

    init(provider: QuoteProvider = .init()) {
        self.provider = provider
    }

    func getTagList() {
        loadingState = .loading
        provider.getTagList(completion: { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.tagList = response
                    self.loadingState = .idle
                }
            case .failure(let error):
                self.loadingState = .error(error)
            }
        })
    }
}
