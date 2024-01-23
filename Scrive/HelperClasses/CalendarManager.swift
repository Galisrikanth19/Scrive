//
//  CalendarManager.swift
//  Created by Srikanth on 28/12/23.

import EventKit
import EventKitUI

/*
 Need to add below values in plist
 
 <key>NSCalendarsUsageDescription</key>
    <string>We need access to your calendar for scheduling events.</string>
 <key>NSCalendarsFullAccessUsageDescription</key>
    <string>We need access to your calendar for scheduling events.</string>
 <key>NSCalendarsWriteOnlyAccessUsageDescription</key>
    <string>We need access to your calendar for scheduling events.</string>
 */

enum CalendarType {
    case single
    case multiple
}

struct CalendarEventModel {
    let title: String
    let startDate: Date
    let endDate: Date
}

protocol CalendarEventDelegate: AnyObject {
    func eventAdded(WithMsg msg: String)
    func failedToAddEvent(WithErrorMsg errMsg: String)
}

final class CalendarManager: NSObject, EKEventEditViewDelegate {
    lazy var eventStore = EKEventStore()
    weak var viewController: UIViewController?
    weak var delegate: CalendarEventDelegate?
    
    private var calendarEventM: CalendarEventModel?
    private var calendarType: CalendarType?
    
    init(BaseViewController viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func addEvent(ToCalendarType calendarType: CalendarType, WithCalendarEventModel calendarEventM: CalendarEventModel) {
        self.calendarEventM = calendarEventM
        self.calendarType = calendarType
        
        switch EKEventStore.authorizationStatus(for: .event) {
            case .notDetermined:
                requestCalendarAccess()
            case .restricted:
                self.delegate?.failedToAddEvent(WithErrorMsg: "This application is not authorised to access the calendar service")
            case .denied:
                self.delegate?.failedToAddEvent(WithErrorMsg: "User denied calendar access, Please enable in settings")
            case .fullAccess:
                showCalendarType()
            case .writeOnly:
                showCalendarType()
            case .authorized:
                showCalendarType()
            default:
                break
        }
    }
    
    private func requestCalendarAccess() {
        if #available(iOS 17.0, *) {
            eventStore.requestFullAccessToEvents { (granted, error) in
                DispatchQueue.main.async {
                    if granted == true {
                        self.showCalendarType()
                    } else {
                        self.delegate?.failedToAddEvent(WithErrorMsg: "The calendar has not been granted access.")
                    }
                }
            }
        } else {
            eventStore.requestAccess(to: .event) { (granted, error) in
                DispatchQueue.main.async {
                    if granted == true {
                        self.showCalendarType()
                    } else {
                        self.delegate?.failedToAddEvent(WithErrorMsg: "The calendar has not been granted access.")
                    }
                }
            }
        }
    }
    
    private func showCalendarType() {
        switch calendarType {
            case .single:
                addEventToSingleCalendar()
            case .multiple:
                addEventToMultipleCalendars()
            case .none:
                break
        }
    }
    
    private func addEventToSingleCalendar() {
        let event = EKEvent(eventStore: eventStore)
        event.title = calendarEventM?.title
        event.startDate = calendarEventM?.startDate
        event.endDate = calendarEventM?.endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        let predicate = eventStore.predicateForEvents(withStart: calendarEventM?.startDate ?? Date(),
                                                      end: calendarEventM?.endDate ?? Date(),
                                                      calendars: nil)
        let existingEventsArr = eventStore.events(matching: predicate)
        
        let duplicatedEvent = existingEventsArr.first { (existingEvent) -> Bool in
            return existingEvent.title == event.title &&
            existingEvent.startDate == event.startDate
        }
        
        if duplicatedEvent != nil {
            self.delegate?.failedToAddEvent(WithErrorMsg: "Event already added.")
        } else {
            do {
                try eventStore.save(event, span: .thisEvent)
            } catch let err as NSError {
                self.delegate?.failedToAddEvent(WithErrorMsg: "Event failed to add. with response \(err.localizedDescription)")
                return
            }
            self.delegate?.eventAdded(WithMsg: "Event added to the calendar successfully.")
        }
    }
    
    private func addEventToMultipleCalendars() {
        let ekEventEditVC = EKEventEditViewController()
        ekEventEditVC.event = EKEvent(eventStore: eventStore)
        ekEventEditVC.event?.title = calendarEventM?.title
        ekEventEditVC.event?.startDate = calendarEventM?.startDate
        ekEventEditVC.event?.endDate = calendarEventM?.endDate
        ekEventEditVC.eventStore = eventStore
        
        ekEventEditVC.editViewDelegate = self
        self.viewController?.present(ekEventEditVC, animated: true, completion: nil)
    }

    // MARK: - EKEventEditViewDelegate
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
        if action == .saved {
            self.delegate?.eventAdded(WithMsg: "Event added to the calendar successfully.")
        } else if action == .canceled {
            self.delegate?.eventAdded(WithMsg: "User canceled event addition.")
        } else if action == .deleted {
            self.delegate?.eventAdded(WithMsg: "User deleted event.")
        }
    }
}
