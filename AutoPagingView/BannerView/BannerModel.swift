//
//  BannerModel.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import Foundation
struct BannerModel {
    func addItem(_ items: [String]) -> [String] {
        var items = items
        items.append("\(items.count + 1)번째 뷰")
        return items
    }
}
