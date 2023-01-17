//
//  File.swift
//  
//
//  Created by Ilxom on 10/01/23.
//

import UIKit

final class StandingsDataSource: NSObject {
    var teams = [StandingsViewModel]()
}

extension StandingsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StandingsTableViewCell.reuseId, for: indexPath) as? StandingsTableViewCell else { return UITableViewCell() }
        cell.showStandings(teams[indexPath.row])
        return cell
    }
}
