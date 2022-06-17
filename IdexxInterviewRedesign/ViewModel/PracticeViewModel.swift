//
//  PracticeViewModel.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import Foundation
import SwiftUI

class PracticeViewModel : ObservableObject{
    
    @Published var practiceDetail : PracticeLocationModel =
    PracticeLocationModel(placeName: "IDEXX Corporate Headquarters", address: "1 Idexx Dr, Westbrook, ME 04092", hoursOfOperation: "24 hours", daysOfOperation: "7 days per week", yearOfOperation: "every day of the year", phoneNumbers:
                            
                            [
                                PracticeNumberModel(type: "phone", phoneNumber: "123.556.0300"),
                                PracticeNumberModel(type: "fax", phoneNumber: "123.456.7890"),
                                PracticeNumberModel(type: "emergency", phoneNumber: "456-789-0123"),
                                PracticeNumberModel(type: "ultrasound", phoneNumber: "123.456.7890"),
                                
                                
                            ],
                          location: Location(id: UUID().uuidString, locationName: "IDEXX Corporate Headquarters", city: "Westbrook", county: "", latitude: 43.661614207286526, longitude: -70.37189369725084, locationDescription: "Biotechnology company in Westbrook, Maine", state: "Maine", stateCode: "ME", type: "Headquaters")
    )
    
    @Published var slide_imgs : [String] = ["idexx","idexx2"]
    
    //Location section
    
    
    
}

