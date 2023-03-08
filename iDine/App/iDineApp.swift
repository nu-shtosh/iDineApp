//
//  iDineApp.swift
//  iDine
//
//  Created by Илья Дубенский on 07.03.2023.
//

import SwiftUI

@main
struct iDineApp: App {

    var order = Order()

    var favorite = Favorite()

    let contentView = AppView()

    var body: some Scene {
        WindowGroup {
            contentView.environmentObject(order).environmentObject(favorite)
        }
    }
}
