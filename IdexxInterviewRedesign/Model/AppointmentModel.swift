//
//  AppointmentModel.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import Foundation


class AppointmentModel : ObservableObject{
    
    
    init(){

        self.appDate = Date()
        self.description = ""
    }
    
    
    init(appDate : Date, description : String ){

        self.appDate = appDate
        self.description = description
    }
    
    var id = UUID()
    var appDate : Date = Date()
    var description : String = ""
}
