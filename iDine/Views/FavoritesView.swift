//
//  FavoritesView.swift
//  iDine
//
//  Created by Илья Дубенский on 08.03.2023.
//

import SwiftUI

struct FavoritesView: View {

    @EnvironmentObject var favorite: Favorite

    var body: some View {
        NavigationView {
            List {
                if favorite.items.isEmpty {
                    Section {
                        Text("You haven't favorites dishes =(")
                    }
                } else {
                    Section {
                        ForEach(favorite.items) { item in
                            HStack {
                                Image(item.thumbnailImage)
                                    .clipShape(Circle())
                                Text(item.name)
                            }
                        }.onDelete(perform: deleteItems)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle("Favorites")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }

    }

    func deleteItems(at offsets: IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {

    static let favorite = Favorite()

    static var previews: some View {
        FavoritesView().environmentObject(favorite)
    }
}
