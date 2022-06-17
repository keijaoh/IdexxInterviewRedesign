//
//  LocationExtension.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/17/22.
//

import Foundation
import MapKit

//Making CLLocationCoordinate2D conform to Codable
extension CLLocationCoordinate2D: Codable {
     public func encode(to encoder: Encoder) throws {
         var container = encoder.unkeyedContainer()
         try container.encode(longitude)
         try container.encode(latitude)
     }
      
     public init(from decoder: Decoder) throws {
         var container = try decoder.unkeyedContainer()
         let longitude = try container.decode(CLLocationDegrees.self)
         let latitude = try container.decode(CLLocationDegrees.self)
         self.init(latitude: latitude, longitude: longitude)
     }
 }

