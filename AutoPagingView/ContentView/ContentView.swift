//
//  ContentView.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import Combine
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var bannerView = BannerView()
    var body: some View {
        NavigationView {
            bannerView
                .navigationTitle("PagingView")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.addButtonTapped.send(())
                        } label: {
                            Text("+")
                        }
                    }
                }
        }
    }

    init() {
        bind()
    }

    func bind() {
        viewModel.addButtonTapped
            .sink { bannerView.viewModel
                .receiveAddItemEvent.send($0)
            }
            .store(in: &viewModel.cancelBag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
