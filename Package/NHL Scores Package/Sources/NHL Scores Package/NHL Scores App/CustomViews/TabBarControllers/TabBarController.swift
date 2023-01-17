//
//  TabBarController.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

public final class TabBarController: UITabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createScheduleVC(), createStandingsVC()]
    }
    
    private func createScheduleVC() -> ScheduleViewController {
        let scheduleVC = ScheduleBuilder.build()
        scheduleVC.tabBarItem.title = "Scores"
        scheduleVC.tabBarItem.image = UIImage(systemName: "sportscourt")
        return scheduleVC
    }
    
    private func createStandingsVC() -> StandingsViewController {
        let standingsVC = StandingsBuilder.build()
        standingsVC.tabBarItem.title = "Standings"
        standingsVC.tabBarItem.image = UIImage(systemName: "list.number")
        return standingsVC
    }
}
