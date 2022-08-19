//
//  Landmark.swift
//  Landmarks
//
//  Created by Young on 2022/6/16.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark : Hashable, Codable, Identifiable {
    var id : Int
    var name : String
    var state : String
    var park : String
    var description : String
    
    var city : String
    var isFeatured : Bool
    var isFavorite : Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    
    private var imageName : String
    
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates : Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D.init(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates : Hashable, Codable {
        var longitude : Double
        var latitude : Double
    }
    
//    "name": "Silver Salmon Creek",
//    "category": "Lakes",
//    "city": "Port Alsworth",
//    "state": "Alaska",
//    "id": 1002,
//    "isFeatured": false,
//    "isFavorite": false,
//    "park": "Lake Clark National Park and Preserve",
//    "coordinates": {
//        "longitude": -152.665167,
//        "latitude": 59.980167
//    },
//    "description": "Suscipit inceptos est felis purus aenean aliquet adipiscing diam venenatis, augue nibh duis neque aliquam tellus condimentum sagittis vivamus, cras ante etiam sit conubia elit tempus accumsan libero, mattis per erat habitasse cubilia ligula penatibus curae. Sagittis lorem augue arcu blandit libero molestie non ullamcorper, finibus imperdiet iaculis ad quam per luctus neque, ligula curae mauris parturient diam auctor eleifend laoreet ridiculus, hendrerit adipiscing sociosqu pretium nec velit aliquam. Inceptos egestas maecenas imperdiet eget id donec nisl curae congue, massa tortor vivamus ridiculus integer porta ultrices venenatis aliquet, curabitur et posuere blandit magnis dictum auctor lacinia, eleifend dolor in ornare vulputate ipsum morbi felis. Faucibus cursus malesuada orci ultrices diam nisl taciti torquent, tempor eros suspendisse euismod condimentum dis velit mi tristique, a quis etiam dignissim dictum porttitor lobortis ad fermentum, sapien consectetur dui dolor purus elit pharetra. Interdum mattis sapien ac orci vestibulum vulputate laoreet proin hac, maecenas mollis ridiculus morbi praesent cubilia vitae ligula vel, sem semper volutpat curae mauris justo nisl luctus, non eros primis ultrices nascetur erat varius integer.",
//    "imageName": "silversalmoncreek"
    
}
