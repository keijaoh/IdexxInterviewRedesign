//
//  LocationsDataService.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/17/22.
//

import Foundation
import MapKit
import Combine

class LocationsDataService {


    var cancellables = Set<AnyCancellable>()
    @Published public var locations: [Location] = [
        //Location,
       Location(id: UUID().uuidString, locationName: "IDEXX Corporate Headquarters", city: "Westbrook", county: "", latitude: 43.661614207286526, longitude: -70.37189369725084, locationDescription: "Biotechnology company in Westbrook, Maine", state: "Maine", stateCode: "ME", type: "Headquaters")
   
       
    ]
    
    init(){
        //call function on load
        
    }
    

    
}

