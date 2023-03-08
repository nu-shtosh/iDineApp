//
//  Favorite.swift
//  iDine
//
//  Created by Илья Дубенский on 08.03.2023.
//

import Foundation

class Favorite: ObservableObject {

    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
