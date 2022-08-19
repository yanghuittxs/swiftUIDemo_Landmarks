//
//  ModelData.swift
//  Landmarks
//
//  Created by Young on 2022/6/17.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    @Published var profile = Profile.default
    
    var hikes: [Hike] = load("hikeData.json")
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}


func load<T : Decodable>(_ fileName : String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError()
    }
    do {
        data = try Data.init(contentsOf: file)
    } catch  {
        fatalError()
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
