//
//  QuoteModel.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 5/4/23.
//

import Foundation

public struct Quote: Identifiable, Codable, Hashable {
    public var id: String
    public let content: String
    public let author: String

    enum CodingKeys: String, CodingKey {
        case id, content, author
    }

    public init(id: String, content: String, author: String) {
        self.id = id
        self.content = content
        self.author = author
    }
}

