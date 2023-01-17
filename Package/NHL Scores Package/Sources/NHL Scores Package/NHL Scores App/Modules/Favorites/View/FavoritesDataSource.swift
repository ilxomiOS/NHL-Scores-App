//
//  File.swift
//  
//
//  Created by Ilxom on 14/01/23.
//

import UIKit

final class FavoritesDataSource: NSObject {
    var favoritesGames = [FavoriteGame]()
}

extension FavoritesDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritesGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.reuseId, for: indexPath) as? FavoritesTableViewCell else { return UITableViewCell() }
        cell.showFavoritesGames(favoritesGames[indexPath.row])
        return cell
    }
}
