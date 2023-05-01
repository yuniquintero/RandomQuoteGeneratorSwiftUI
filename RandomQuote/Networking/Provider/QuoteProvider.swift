
import Foundation
import package_networking
import package_models

struct QuoteProvider {
    private let repository: QuoteRepository = .init()

    func getRandomQuote(completion: @escaping APIResponseCompletion<[Quote]>) {
        repository.getRandomQuote(completion: completion)
    }

    func getTagQuote(tag: String, completion: @escaping APIResponseCompletion<[Quote]>) {
        repository.getTagQuote(tag: tag, completion: completion)
    }

    func getTagList(completion: @escaping APIResponseCompletion<[Tag]>) {
        repository.getTagList(completion: completion)
    }
}
