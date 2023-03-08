//
//  ContentView.swift
//  iDine
//
//  Created by Илья Дубенский on 07.03.2023.
//

import SwiftUI

struct MenuView: View {

    private let menu = Bundle.main.decode([MenuSection].self,
                                          from: "menu.json")

    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { menuItem in
                            MenuItemCell(menuItem: menuItem)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.insetGrouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
