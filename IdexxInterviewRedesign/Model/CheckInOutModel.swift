//
//  CheckInOutModel.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import Foundation

class CheckInOutModel : ObservableObject{
    
    init(){
        self.locationName = ""
        self.dateIn = Date()
        self.dateOut = Date()
        self.description = ""
    }
    
    
    init(locationName : String,dateIn : Date, dateOut : Date, description : String ){
        self.locationName = locationName
        self.dateIn = dateIn
        self.dateOut = dateOut
        self.description = description
    }
    
    var id = UUID()
    var locationName : String = ""
    var dateIn : Date = Date()
    var dateOut : Date = Date()
    var description : String = ""
    
}
