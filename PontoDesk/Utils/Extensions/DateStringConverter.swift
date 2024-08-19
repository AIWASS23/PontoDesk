//
//  DateStringConverter.swift
//  PontoDesk
//
//  Created by Marcos Bezerra on 18/08/24.
//

import Foundation

extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:s.SZ") -> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date

    }
}

extension Date {

    func toString(withFormat format: String = "EEEE ، d MMMM yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
