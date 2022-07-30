//
//  GeoCode.swift
//  TestApp
//
//  Created by Mohamed on 28/07/2022.
//

import Foundation

public class GeoCode: Codable {
    public var name: String?
    public var local_names: [String: String?]?
    public var lat: Double?
    public var lon: Double?
    public var country: String?
    public var state: String?
}
