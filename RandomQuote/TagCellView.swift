//
//  TagCellView.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 19/4/23.
//

import SwiftUI

struct TagCellView: View {
    var name: String

    var body: some View {
        VStack {
            Text(name)
                .padding(5)
                .background(Color.white)
                .cornerRadius(4)
                .multilineTextAlignment(.center)
        }
        .aspectRatio(contentMode: .fill)
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), opacity: 0.6))
    }
}

struct GenreCellView_Previews: PreviewProvider {
    static var previews: some View {
        TagCellView(name: "name")
    }
}
