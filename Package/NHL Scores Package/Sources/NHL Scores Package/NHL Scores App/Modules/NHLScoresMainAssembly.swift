//
//  TabBarController.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit

public enum NHLScoresMainAssembly {
    public static func makeRootViewController() -> UIViewController {
        let vc = UITabBarController()
         vc.viewControllers = [
             ScheduleBuilder.build(),
             StandingsBuilder.build()
         ]
         return vc
    }
}
