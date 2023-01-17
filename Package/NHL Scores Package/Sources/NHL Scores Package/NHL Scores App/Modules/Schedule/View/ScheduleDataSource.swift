//
//  File.swift
//  
//
//  Created by Ilxom on 13/01/23.
//

import UIKit

final class ScheduleDataSource: NSObject {
    var games = [ScheduleViewModel]()
}

extension ScheduleDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.reuseId, for: indexPath) as? ScheduleTableViewCell else { return UITableViewCell() }
        cell.showSchedule(games[indexPath.row])
        return cell
    }
}
