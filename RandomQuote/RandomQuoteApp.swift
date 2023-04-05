//
//  RandomQuoteApp.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 5/4/23.
//

import SwiftUI

@main
struct RandomQuoteApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = ViewModel()
            ContentView(viewModel: viewModel)
        }
    }
}
