//
//  PracticeLocationModel.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//

import Foundation
import SwiftUI
import MapKit

class PracticeLocationModel : ObservableObject{
    
    init(placeName : String ,address : String,hoursOfOperation : String,daysOfOperation : String,yearOfOperation : String,phoneNumbers : [PracticeNumberModel],location : Location)
    {
        
        self.placeName = placeName
        self.address = address
        self.hoursOfOperation = hoursOfOperation
        self.daysOfOperation = daysOfOperation
        self.yearOfOperation = yearOfOperation
        
        self.phoneNumbers = phoneNumbers
        self.location = location
    }
    
    var id = UUID()
    var placeName : String = ""
    var address : String = ""
    
    var hoursOfOperation : String = ""
    var daysOfOperation : String = ""
    var yearOfOperation : String = ""
    
    var phoneNumbers : [PracticeNumberModel] = [PracticeNumberModel]()
    var location : Location = Location()
    
}


class PracticeNumberModel : ObservableObject{
    
    init(type : String, phoneNumber : String){
        self.type = type
        self.phoneNumber = phoneNumber
    }
    
    var id = UUID()
    var type : String = ""
    var phoneNumber : String = ""
    
    
    
}


//location model (Remove excess when done)
struct Location : Identifiable, Equatable, Codable{
 

    init(id : String, locationName: String, city : String, county: String, latitude : Double, longitude : Double,
         locationDescription : String, state: String, stateCode: String, type: String){
        
        self.id = id
        
        self.locationName = locationName
        self.city = city
        self.county = county
        self.latitude = latitude
        self.longitude = longitude
        self.locationDescription = locationDescription
        self.state = state
        self.stateCode = stateCode
        self.type = type
    }
    
    init(){
        self.id = ""
    
        self.locationName = ""
        self.city = ""
        self.county = ""
        self.latitude = 0.0
        self.longitude = 0.0
        self.locationDescription = ""
        self.state = ""
        self.stateCode = ""
        self.type = ""
}
    
    //Identifiable
    var id : String
    let locationName: String
    let city, county: String
    let latitude, longitude: Double
    let locationDescription : String
    let state: String
    let stateCode: String

    
    
    
    let type: String

 
    let imageNames : [String] = ["https://firebasestorage.googleapis.com/v0/b/keijaoh-576a0.appspot.com/o/defaultImages%2FNoImageFound.jpg1_.png?alt=media&token=75d79486-de11-4096-8b7d-d8b1945d71cf"]
    let link : String = "https://www.idexx.com/en/"
    var coordinates : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        //what logic to use to determine if both are the same
        lhs.id == rhs.id
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case locationName = "locationName"
        case county = "county"
      
        case link = "link"
        case imageNames = "imageNames"
        case city = "city"
        case latitude = "latitude"
        case longitude = "longitude"
        case locationDescription = "Description"
        case type = "Type"
        case state = "state"
        case stateCode = "stateCode"
      
     
    }
}
