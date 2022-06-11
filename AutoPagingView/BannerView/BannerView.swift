//
//  BannerView.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import Combine
import SwiftUI

struct BannerView: View {
    @ObservedObject var viewModel = BannerViewModel()

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                GeometryReader { geometry in
//            ScrollViewReader { proxy in
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(viewModel.items, id: \.self) { text in
//                            Text(text).background(Color.random)
                                Button(text) {
                                    withAnimation {
                                        proxy.scrollTo(viewModel.items[viewModel.items.count - 1])
                                    }
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    }
//            }
                }.onAppear {
                    UIScrollView.appearance().isPagingEnabled = true

//            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
//                withAnimation {
//                    proxy.scrollTo(viewModel.items[viewModel.currentBannerIndex])
//                }
//            }
                }
            }
        }
    }
}
