//
//  MenuItemRow.swift
//  iDine
//
//  Created by Илья Дубенский on 07.03.2023.
//

import SwiftUI

struct MenuItemCell: View {

    var menuItem: MenuItem

    static let colors: [String: Color] = ["D": .purple,
                                          "G": .black,
                                          "N": .red,
                                          "S": .blue,
                                          "V": .green]

    var body: some View {
        NavigationLink(destination: MenuItemDetailView(menuItem: menuItem)) {
            HStack {
                Image(menuItem.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))

                VStack(alignment: .leading) {
                    Text(menuItem.name)
                        .font(.headline)
                    Text("$\(menuItem.price)")
                }

                Spacer()

                ForEach(menuItem.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCell(menuItem: MenuItem.example)
    }
}
