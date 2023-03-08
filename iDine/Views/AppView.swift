//
//  AppView.swift
//  iDine
//
//  Created by Илья Дубенский on 08.03.2023.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {

    static let order = Order()

    static let favorite = Favorite()

    static var previews: some View {
        AppView().environmentObject(order).environmentObject(favorite)
    }
}
