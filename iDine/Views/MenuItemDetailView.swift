//
//  MenuItemDetail.swift
//  iDine
//
//  Created by Илья Дубенский on 07.03.2023.
//

import SwiftUI

struct MenuItemDetailView: View {

    var menuItem: MenuItem

    static let order = Order()

    static let favorite = Favorite()

    @EnvironmentObject var order: Order

    @EnvironmentObject var favorite: Favorite

    @State var isFavorite = false

    var body: some View {
        VStack {

            ZStack(alignment: .bottomTrailing) {
                Image(menuItem.mainImage)
                Text("Photo: \(menuItem.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(menuItem.description)
                .padding()

            Spacer()

            Button("Order This") {
                self.order.add(item: self.menuItem)
            }
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle(menuItem.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addToFavorite) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                }.animation(.default, value: isFavorite)
            }
        }
    }

    func addToFavorite() {
        if self.favorite.items.contains(menuItem) {
            self.isFavorite.toggle()
            self.favorite.remove(item: menuItem)
        } else {
            self.isFavorite.toggle()
            self.favorite.add(item: menuItem)
        }

    }
}

struct MenuItemDetail_Previews: PreviewProvider {

    static let order = Order()

    static let favorite = Favorite()

    static var previews: some View {
        NavigationView() {
            MenuItemDetailView(menuItem: MenuItem.example).environmentObject(order).environmentObject(favorite)
        }
    }
}
