//
//  ScheduleViewController.swift
//  
//
//  Created by Ilxom on 05/01/23.
//

import UIKit
import SnapKit

final class ScheduleViewController: UIViewController {
    
    lazy var scheduleView = ScheduleView()
    private let presenter: SchedulePresenterProtocol
    
    init(presenter: SchedulePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.updateViewWithShedule(view: scheduleView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = scheduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTaps()
    }
    
    private func configureTaps() {
        let sheduleView = self.scheduleView
        scheduleView.didSelectedSegment = { [weak self] day in
            self?.presenter.day = day
            self?.presenter.updateViewWithShedule(view: sheduleView)
        }
        
        scheduleView.index = { [weak self] index in
            self?.presenter.selectGame(at: index)
        }
        
        scheduleView.didTapFavoriteButton = { [weak self] in
            self?.presenter.didTapFavoritesButton()
        }
    }
    
}
