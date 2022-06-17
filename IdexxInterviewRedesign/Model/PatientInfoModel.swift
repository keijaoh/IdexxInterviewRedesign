//
//  PatientInfoModel.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import Foundation


class PatientInfoModel : ObservableObject{
    
    init(){
        self.patient = PatientProfleModel()
        self.client = ClientInfoModel()
        self.recordedDateTime = ""
        self.checkInOutDetail = CheckInOutModel()
        self.appointments = [AppointmentModel]()
    }
    
    init(patient : PatientProfleModel, client : ClientInfoModel, recordedDateTime : String){
        self.patient = patient
        self.client = client
        self.recordedDateTime = recordedDateTime
       
    }
    
    init(patient : PatientProfleModel, client : ClientInfoModel, recordedDateTime : String, checkInOutDetail : CheckInOutModel){
        self.patient = patient
        self.client = client
        self.recordedDateTime = recordedDateTime
        
        self.checkInOutDetail = checkInOutDetail
    }
    
    // var appointments : [AppointmentModel]
    init(patient : PatientProfleModel, client : ClientInfoModel, recordedDateTime : String, checkInOutDetail : CheckInOutModel,appointments : [AppointmentModel]){
        self.patient = patient
        self.client = client
        self.recordedDateTime = recordedDateTime
        
        self.checkInOutDetail = checkInOutDetail
        self.appointments = appointments
    }
    
    var id = UUID()
    var patient : PatientProfleModel = PatientProfleModel()
    var client : ClientInfoModel = ClientInfoModel()
    var recordedDateTime : String = ""
    
    var checkInOutDetail : CheckInOutModel = CheckInOutModel()
    
    var appointments : [AppointmentModel] = [AppointmentModel]()
    
}


class ClientInfoModel : ObservableObject{
    
    init(){
        self.firstName = ""
        self.lastName = ""
       
        self.phoneNumber = ""
        self.emailAddress = ""
        self.clientAddress = ""
        
    }
    
    init(firstName : String, lastName : String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(firstName : String, lastName : String, phoneNumber : String, emailAddress : String, clientAddress : String )
    {
        self.firstName = firstName
        self.lastName = lastName
        
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
        self.clientAddress = clientAddress
    }
    
    var id = UUID()
    var firstName : String = ""
    var lastName : String = ""
    
    var phoneNumber : String = ""
    var emailAddress : String = ""
    var clientAddress : String = ""
    
}


class PatientProfleModel : ObservableObject{
    
    init(){
        self.name = ""
        self.breedType = ""
        self.color = ""
        
        self.weight = 0
        self.weightUnit = ""
        self.birthdate = ""
        self.altered = false
        self.sex = ""
        self.species = ""
    }
    
    init(name : String, breedType : String, color : String){
        self.name = name
        self.breedType = breedType
        self.color = color
    }
    
    
    init(name : String, breedType : String, color : String,weight : Float, weightUnit : String, birthdate : String,altered : Bool,
         sex : String, species : String){
        self.name = name
        self.breedType = breedType
        self.color = color
        
        self.weight = weight
        self.weightUnit = weightUnit
        self.birthdate = birthdate
        self.altered = altered
        self.sex = sex
        self.species = species
    }
    
    
    var id = UUID()
    var name : String = ""
    var breedType : String = ""
    var color : String = ""
    
    var weight : Float = 0
    var weightUnit : String = ""
    
    var birthdate : String = ""
    var altered : Bool = false
    var sex : String = ""
    var species : String = ""
    
    
}
