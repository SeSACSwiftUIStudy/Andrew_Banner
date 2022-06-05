//
//  ContentViewModel.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import Combine
class ContentViewModel: ObservableObject {
    let addButtonTapped = PassthroughSubject<Void, Never>()
    var cancelBag = Set<AnyCancellable>()
    
    @Published var items: [String] = ["출발~"]
}
