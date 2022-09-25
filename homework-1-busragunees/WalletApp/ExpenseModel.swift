//
//  ExpenseModel.swift
//  WalletApp
//
//  Created by Büşra Güneş on 9.09.2022.
//

import Foundation
import UIKit


struct ExpenseModel {
    var price:Double?
    var date:String?
    var description:String?
    var category:CategoryType?
    
    
    init(price:Double?,date:String?,description:String?,category:CategoryType?) {
        self.price = price
        self.date = date
        self.description = description
        self.category = category
    }
    
    
}


//enum of include of category types and names.

enum CategoryType{
    case coffee
    case travel
    case medical
    case market
    case other
    var img:UIImage{
        switch self {
        case .coffee:
            return UIImage(imageLiteralResourceName: "CoffeeIcon")
        case .travel:
            return UIImage(imageLiteralResourceName: "TravelIcon")
        case .medical:
            return UIImage(imageLiteralResourceName: "MedicalIcon")
        case .market:
            return UIImage(imageLiteralResourceName: "MarketIcon")
        case .other:
            return UIImage(imageLiteralResourceName: "OtherIcon")
        }
    }
    var name:String{
        switch self {
        case .coffee:
            return "Coffee"
        case .travel:
            return "Travel"
        case .medical:
            return "Medical"
        case .market:
            return "Market"
        case .other:
            return "Other"
        }
    }
}
