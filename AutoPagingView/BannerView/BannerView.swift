//
//  BannerView.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import SwiftUI
import Combine

struct BannerView: View {
    
       @ObservedObject var viewModel = BannerViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(viewModel.items, id: \.self) { text in
                        Text(text).background(Color.random)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }.onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
    }
}
