//
//  PatientInfoViewModel.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import Foundation
import SwiftUI

class PatientInfoViewModel : ObservableObject{
    
    
    @Published var patientDetail : PatientInfoModel = PatientInfoModel(patient: PatientProfleModel(name: "Zero", breedType: "Abyssinian", color: "Tan",weight: 31.2,weightUnit: "kilograms",birthdate: "1/6/2007",altered: true,sex: "Female",species: "Canine"), client: ClientInfoModel(firstName: "Roland", lastName: "Brown",phoneNumber: "207-555-2349",emailAddress: "l.lornac@gmail.com",clientAddress: "1 City Center Portland ME 04101"), recordedDateTime: "06/16/2022",checkInOutDetail: CheckInOutModel(locationName: "VSEH", dateIn: Date(), dateOut: Date() + 1, description: "IM Initial Consult"),
appointments: [AppointmentModel(appDate: Date(), description: "Aaron Kirsch, DVM DACVIM/IM Recheck"),AppointmentModel(appDate: Date() - 2, description: "Aaron Kirsch, DVM DACVIM/IM Recheck")])
    
    @Published var patientsDetail : [PatientInfoModel] = [
        PatientInfoModel(patient: PatientProfleModel(name: "Zero", breedType: "Abyssinian", color: "Tan",weight: 31.2,weightUnit: "kilograms",birthdate: "1/6/2007",altered: true,sex: "Female",species: "Canine"), client: ClientInfoModel(firstName: "Roland", lastName: "Brown",phoneNumber: "207-555-2349",emailAddress: "l.lornac@gmail.com",clientAddress: "1 City Center Portland ME 04101"), recordedDateTime: "06/16/2022",checkInOutDetail: CheckInOutModel(locationName: "VSEH", dateIn: Date(), dateOut: Date() + 1, description: "IM Initial Consult"),appointments: [AppointmentModel(appDate: Date(), description: "Roland Brown, DVM DACVIM/IM Recheck"),AppointmentModel(appDate: Date() - 2, description: "Roland Brown, DVM DACVIM/IM Recheck")]),
        PatientInfoModel(patient: PatientProfleModel(name: "Scotty", breedType: "Angora", color: "White",weight: 61.2,weightUnit: "kilograms",birthdate: "1/6/2017",altered: false,sex: "Male",species: "Canine"), client: ClientInfoModel(firstName: "Agnes", lastName: "Jones",phoneNumber: "207-123-2349",emailAddress: "testac@gmail.com",clientAddress: "1 Test Center Testler ME 04101"), recordedDateTime: "06/16/2022",checkInOutDetail: CheckInOutModel(locationName: "VSEH", dateIn: Date(), dateOut: Date() + 1, description: "IM Initial Consult"),appointments: [AppointmentModel(appDate: Date(), description: "Agnes Jones, DVM DACVIM/IM Recheck"),AppointmentModel(appDate: Date() - 2, description: "Agnes Jones, DVM DACVIM/IM Recheck")]),
        PatientInfoModel(patient: PatientProfleModel(name: "Wally", breedType: "Shih Tzu Mix", color: "Black",weight: 10.3,weightUnit: "kilograms",birthdate: "1/6/2010",altered: true,sex: "Female",species: "Canine"), client: ClientInfoModel(firstName: "Ben", lastName: "Smith",phoneNumber: "207-421-2349",emailAddress: "smail@gmail.com",clientAddress: "1 Smith Center Portland ME 04101"), recordedDateTime: "06/16/2022",checkInOutDetail: CheckInOutModel(locationName: "VSEH", dateIn: Date(), dateOut: Date() + 1, description: "IM Initial Consult"),appointments: [AppointmentModel(appDate: Date(), description: "Ben Smith, DVM DACVIM/IM Recheck")])
                                                          
                                                          ]
    
}
