//
//  DateExtension.swift
//  ToDoList
//
//  Created by Büşra Güneş on 22.09.2022.
//

import Foundation


enum DateFormat{
    case yyyyMMdd
    case ddMMyyyy
    case ddMMHHmm
    case ddMMM
}
//MARK: - Formats the date according to the format type we give to get format date.

extension DateFormat{
    func getFormat() -> String{
        switch self {
        case .ddMMyyyy:
            return "dd.MM.yyyy HH:mm:ss"
        case .yyyyMMdd:
            return "yyyy.MM.dd HH:mm:ss"
        case .ddMMHHmm:
            return "dd.MM HH:mm"
        case .ddMMM:
            return "dd MMM"
        }
    }
}
extension Date {
   
   func getFormattedDate(format: DateFormat) -> String {
        let dateformat = DateFormatter()
       dateformat.dateFormat = format.getFormat()
        return dateformat.string(from: self)
    }
}
