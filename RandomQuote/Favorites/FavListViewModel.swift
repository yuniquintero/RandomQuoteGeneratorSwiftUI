//
//  FavListViewModel.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 7/6/23.
//

import Foundation
import package_models

final class FavListViewModel: ObservableObject {

    var savedQuotes : [[String:Any]] = (UserDefaults.standard.array(forKey: "favorites") ?? []) as? [[String:Any]] ?? []

    func getQuotes() -> [Quote] {
        var favQuotes : [Quote] = []
        let favorites = savedQuotes
        for fav in favorites {
            let quote = Quote(id: fav["id"] as? String ?? "", content: fav["content"] as? String ?? "", author: fav["author"] as? String ?? "" , tags: fav["tags"] as? [String] ?? [])
            favQuotes.append(quote)

        }
        return favQuotes
    }

}

