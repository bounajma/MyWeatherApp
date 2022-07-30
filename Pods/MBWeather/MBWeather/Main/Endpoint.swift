//
//  Endpoint.swift
//  TestApp
//
//  Created by Mohamed on 28/07/2022.
//

import Foundation

// Abstraction of an Endpoint
public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryParams: [URLQueryItem]? { get}
}

extension Endpoint {

    public var scheme: String {
        return "https"
    }
    
    public var host: String {
        return "api.openweathermap.org"
    }
    
    public var body: [String: String]? {
        return nil
    }
    
    public var queryParams: [URLQueryItem]? {
        return nil
    }
    
}
