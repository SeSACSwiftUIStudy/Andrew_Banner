//
//  Color+Ex.swift
//  AutoPagingView
//
//  Created by 한상준 on 2022/06/05.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
