//
//  Assignment_citrixTests.swift
//  Assignment-citrixTests
//
//  Created by Nitin Agnihotri on 02/07/22.
//

import XCTest
@testable import Assignment_citrix

class Assignment_citrixTests: XCTestCase {
    
    var sut: URLSession!
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
        try XCTSkipUnless(
            ConnectionManager.sharedInstance.isReachable,
            "Network connectivity needed for this test.")
        
        // given
        let urlString = newsListUrl
        let url = URL(string: urlString)!
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sut.dataTask(with: url) { _, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    
    func testHtmlUrl() throws {
        try XCTSkipUnless(
            ConnectionManager.sharedInstance.isReachable,
            "Network connectivity needed for this test.")
        
        // given
        let urlString = "https://www.nytimes.com/2022/06/30/science/listeria-outbreak-florida.html"
        let url = URL(string: urlString)!
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sut.dataTask(with: url) { _, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
