//
//  BannerView.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import Combine
import SwiftUI

let randomImage = ["image1", "image2", "image3", "image4"]

struct BannerContentsView: View {
    var title: String

    init(title: String) {
        self.title = title
    }

    var body: some View {
        Image(randomImage.randomElement()!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                Text(title)
                    .background(Color.random),
                alignment: .bottomTrailing
            )
    }
}

struct BannerView: View {
    @ObservedObject var viewModel = BannerViewModel()

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                GeometryReader { geometry in
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(viewModel.items, id: \.self) { text in
                                BannerContentsView(title: text)
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    }
                }.onAppear {
                    UIScrollView.appearance().isPagingEnabled = true

                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                        withAnimation {
                            proxy.scrollTo(viewModel.items[viewModel.getCurrentIndex()])
                        }
                    }
                }
            }
        }
    }
}
