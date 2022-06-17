//
//  PreviewProvider.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import Foundation
import SwiftUI

//Preview data to use throughtout the app
extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}


class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    
    var practiceDetail : PracticeLocationModel =
    PracticeLocationModel(placeName: "VSEH", address: "123 Anywhere Street Tulsa, Oklahoma 74587", hoursOfOperation: "24 hours", daysOfOperation: "7 days per week", yearOfOperation: "every day of the year", phoneNumbers:
                            
                            [
                                PracticeNumberModel(type: "phone", phoneNumber: "123.456.7890"),
                                PracticeNumberModel(type: "fax", phoneNumber: "123.456.7890"),
                                PracticeNumberModel(type: "emergency", phoneNumber: "456-789-0123"),
                                PracticeNumberModel(type: "ultrasound", phoneNumber: "123.456.7890"),
                                
                                
                            ],
                          location: Location(id: UUID().uuidString, locationName: "IDEXX Corporate Headquarters", city: "Westbrook", county: "", latitude: 43.661614207286526, longitude: -70.37189369725084, locationDescription: "Biotechnology company in Westbrook, Maine", state: "Maine", stateCode: "ME", type: "Headquaters")
    )
    
    
    var patientDetail : PatientInfoModel = PatientInfoModel(patient: PatientProfleModel(name: "Zero", breedType: "Abyssinian", color: "Tan",weight: 31.2,weightUnit: "kilograms",birthdate: "1/6/2007",altered: true,sex: "Female",species: "Canine"), client: ClientInfoModel(firstName: "Roland", lastName: "Brown",phoneNumber: "207-555-2349",emailAddress: "l.lornac@gmail.com",clientAddress: "1 City Center Portland ME 04101"), recordedDateTime: "06/16/2022",checkInOutDetail: CheckInOutModel(locationName: "VSEH", dateIn: Date(), dateOut: Date() + 1, description: "IM Initial Consult"),appointments: [AppointmentModel(appDate: Date(), description: "Aaron Kirsch, DVM DACVIM/IM Recheck"),AppointmentModel(appDate: Date() - 2, description: "Aaron Kirsch, DVM DACVIM/IM Recheck")]
    )
    
    
    
}


