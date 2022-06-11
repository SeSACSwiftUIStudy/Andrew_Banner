//
//  BannerViewModel.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import Combine

class BannerViewModel: ObservableObject {
    let receiveAddItemEvent = PassthroughSubject<Void, Never>()
    var model: BannerModel!

    @Published var items: [String] = ["출발~"]

    init(model: BannerModel = BannerModel()) {
        self.model = model

        receiveAddItemEvent
            .map { _ in model.addItem(self.items) }
            .assign(to: &$items)
    }

    func getCurrentIndex() -> Int {
        let currentIndex = model.getCurrentIndex()
        model.setNextIndex(items.count)
        return currentIndex
    }
}
