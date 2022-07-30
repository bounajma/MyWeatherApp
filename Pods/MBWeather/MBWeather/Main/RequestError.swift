//
//  RequestError.swift
//  TestApp
//
//  Created by Mohamed on 28/07/2022.
//

import Foundation


public enum RequestError: Error {
    case casting
    case missingParams
    case noResponse
    case unknown
}
