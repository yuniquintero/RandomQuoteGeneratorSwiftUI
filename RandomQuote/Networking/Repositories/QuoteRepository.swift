//
//  QuoteRepository.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 5/4/23.
//

import Foundation
import package_networking
import package_models

struct QuoteRepository {
    func getRandomQuote(completion: @escaping APIResponseCompletion<[Quote]>) {
        guard let url = URL(string: API.Path.getRandomQuote) else {
            return completion(.failure(ErrorType.url))
        }
        let request: URLRequest = .init(url: url, httpMethod: .get)
        ModuleNetworking.request(request: request, completion)
    }

    func getTagQuote(tag: String, completion: @escaping APIResponseCompletion<[Quote]>) {
        guard let url = URL(string: API.Path.getTagQuote + tag) else {
            return completion(.failure(ErrorType.url))
        }
        let request: URLRequest = .init(url: url, httpMethod: .get)
        ModuleNetworking.request(request: request, completion)
    }

    func getTagList(completion: @escaping APIResponseCompletion<[Tag]>) {
        guard let url = URL(string: API.Path.getTags) else {
            return completion(.failure(ErrorType.url))
        }
        let request: URLRequest = .init(url: url, httpMethod: .get)
        ModuleNetworking.request(request: request, completion)
    }
}
