//
//  Location.swift
//  
//
//  Created by Felipe Izepe on 11/12/21.
//

import Foundation

public class Location: Identifiable {

    public private(set) var id: String
    public private(set) var name: String

    init(locationDTO: LocationDTO) {
        self.id = "\(locationDTO.woeid)"
        self.name = locationDTO.title
    }
}
