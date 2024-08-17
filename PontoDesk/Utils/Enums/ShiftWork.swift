//
//  ShiftWork.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 09/08/24.
//

import Foundation

enum ShiftWork: String, CaseIterable, Identifiable {
    case morning = "Manhã"
    case afternoon = "Tarde"
    case evening = "Noite"
    
    var id: String { self.rawValue }
    
    var timeRange: ClosedRange<Date> {
        let calendar = Calendar.current
        let today = Date()
        
        switch self {
        case .morning:
            let start = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: today)!
            let end = calendar.date(bySettingHour: 12, minute: 0, second: 0, of: today)!
            return start...end
            
        case .afternoon:
            let start = calendar.date(bySettingHour: 13, minute: 0, second: 0, of: today)!
            let end = calendar.date(bySettingHour: 17, minute: 0, second: 0, of: today)!
            return start...end
            
        case .evening:
            let start = calendar.date(bySettingHour: 18, minute: 0, second: 0, of: today)!
            let end = calendar.date(bySettingHour: 22, minute: 0, second: 0, of: today)!
            return start...end
        }
    }
}
