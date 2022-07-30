//
//  GeoCodeEndpoint.swift
//  TestApp
//
//  Created by Mohamed on 28/07/2022.
//

import Foundation

public class GeoCodeEndpoint: Endpoint {
    
    let APIKey = "93f7e20f81671abdb08c1911cdc10408"
    var q: String
    var limit: Int
    
    public init(q: String, limit: Int) {
        self.q = q
        self.limit = limit
    }
    
    public var path: String {
        return "/geo/1.0/direct"
    }
    
    public var method: RequestMethod {
        return .get
    }
    
    public var header: [String : String]? {
        return nil
    }
    
    public var queryParams: [URLQueryItem]? {
        return [URLQueryItem(name: "q", value: self.q), URLQueryItem(name: "limit", value: "\(self.limit)"), URLQueryItem(name: "appid", value: "\(self.APIKey)")]
    }
    
}
