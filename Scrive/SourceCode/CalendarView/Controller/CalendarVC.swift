//
//  CalendarVC.swift
//  Created by Webappclouds on 04/01/24.

import UIKit

class CalendarVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    lazy var calendarManager: CalendarManager = {
        let calManager = CalendarManager(BaseViewController: self)
        calManager.delegate = self
        return calManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
}

// MARK: - Customize screen
extension CalendarVC {
    private func setupVC() {
        setupTopBar()
    }
}

// MARK: - Topbar
extension CalendarVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "CalendarVC")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - IBActions
extension CalendarVC {
    @IBAction func addEventSingleCalendarBtnClicked(_ sender: UIButton) {
        let calendarEventM = CalendarEventModel(title: "Single Calendar Event",
                                                startDate: DateHelper.today,
                                                endDate: DateHelper.getDateOnAddingSeconds(WithSeconds: (60*60))) //Min*seconds
        calendarManager.addEvent(ToCalendarType: .single, WithCalendarEventModel: calendarEventM)
    }
    
    @IBAction func addEventMultiCalendarBtnClicked(_ sender: UIButton) {
        let calendarEventM = CalendarEventModel(title: "Multi Calendar Event",
                                                startDate: DateHelper.today,
                                                endDate: DateHelper.getDateOnAddingSeconds(WithSeconds: (60*60))) //Min*seconds
        calendarManager.addEvent(ToCalendarType: .multiple, WithCalendarEventModel: calendarEventM)
    }
}

// MARK: - CalendarEventDelegate
extension CalendarVC: CalendarEventDelegate {
    func eventAdded(WithMsg msg: String) {
        self.showToast(WithMessage: msg)
    }
    
    func failedToAddEvent(WithErrorMsg errMsg: String) {
        self.showErrorToast(WithMessage: errMsg)
    }
}

