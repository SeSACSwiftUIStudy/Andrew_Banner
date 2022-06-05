//
//  BannerViewModel.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import Combine

class BannerViewModel : ObservableObject {
    let receiveAddItemEvent = PassthroughSubject<Void, Never>()
    
    @Published var items: [String] = ["출발~"]
    
    init(model:BannerModel = BannerModel()) {
        receiveAddItemEvent
            .map { _ in model.addItem(self.items)}
            .assign(to: &$items)
    }
}
