//
//  MyWeatherAppTests.swift
//  MyWeatherAppTests
//
//  Created by Mohamed on 30/07/2022.
//

import XCTest
@testable import MyWeatherApp

class TownsListVMTests: XCTestCase {
    
    /*
     Creating a TownsService Stub in order to test TownsListVM
     */
    class ServiceStub: TownsService {
        func getSavedTowns() -> [Town] {
            let town = Town(name: "Test Town")
            town.status = "Clear"
            town.temp = 29.00
            return [town]
        }
    }
    
    var townsVM: TownsListVM!

    override func setUpWithError() throws {
        townsVM = TownsListVM()
        
        //Given
        let serciceStub = ServiceStub()
        townsVM.townsService = serciceStub
        
    }

    override func tearDownWithError() throws {
        townsVM = nil
    }
    
    func testSavingResultsToLocalVar() {
        
        //When
        townsVM.getTownsList()
        
        //Then
        XCTAssertEqual(townsVM.townsList?.count, 1)
    }
    
    func testFormattingViewData() {
        //When
        townsVM.getTownsList()
        
        //Then
        XCTAssertEqual(townsVM?.townsViewsData?[0].name, "Test Town")
    }

}
