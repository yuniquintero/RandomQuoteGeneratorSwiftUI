//
//  ContentView.swift
//  RandomQuote
//
//  Created by Yuni Quintero on 5/4/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    @State private var textSwitch = false

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "quote.closing")
                    .foregroundColor(Color.orange)
                    .font(.system(size: 120))
                    .padding()
                Text("Random Quote Generator")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
            VStack {
                if viewModel.loadingState == .loading {
                    Text("Loading...")
                } else if case .error(let error) = viewModel.loadingState {
                    Text(error.localizedDescription)
                } else {
                    Text("\"" + (viewModel.randomQuote?.content ?? "") + "\"")
                        .italic()
                        .font(.system(size: 20))
                        .padding()
                    Text(viewModel.randomQuote?.author ?? "")
                        .font(.caption)
                }
            }
            .padding()
            Spacer()
            HStack(spacing: 30) {
                Button(action: {
                    viewModel.getData()
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .foregroundColor(Color.orange)
                        .font(.system(size: 40))
                })
                Button(action: {
                    UIPasteboard.general.setValue(viewModel.randomQuote?.content ?? "",
                                                  forPasteboardType: UTType.plainText.identifier)
                    self.textSwitch.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.textSwitch.toggle()
                            }
                }, label: {
                    Image(systemName: "doc.on.doc.fill")
                        .foregroundColor(Color.orange)
                        .font(.system(size: 34))
                })
            }
            Text(textSwitch ? "Quote sent to clipboard!" : "")
                .font(.footnote)
                .padding()
                .foregroundColor(.gray)
        }
        /*Button(action: {
            viewModel.getTagList()
            print("SOS", viewModel.tagList)
        }, label: {
            Text("mostrar lista")
        })*/
        .onAppear {
            viewModel.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        ContentView(viewModel: viewModel)
    }
}
