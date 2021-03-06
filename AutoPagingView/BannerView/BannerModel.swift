//
//  BannerModel.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import Foundation
struct BannerModel {
    private var currentIndex: Int = 0
    mutating func setNextIndex(_ max: Int) {
        currentIndex += 1

        if currentIndex > (max - 1) {
            currentIndex = 0
        }
    }

    func getCurrentIndex() -> Int {
        return currentIndex
    }

    func addItem(_ items: [String]) -> [String] {
        var items = items
        items.append("\(items.count + 1)번째 뷰")
        return items
    }
}
