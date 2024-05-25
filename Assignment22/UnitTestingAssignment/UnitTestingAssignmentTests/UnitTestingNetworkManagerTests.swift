//
//  UnitTestingNetworkManagerTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Akaki Titberidze on 13.05.24.
//

import XCTest
@testable import UnitTestingAssignment

class MockURLSession: URLSession {
    var nextData: Data?
    var nextError: Error?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(nextData, nil, nextError)
        return MockURLSessionDataTask()
    }
    
}

class MockURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}

class NetworkManagerTests: XCTestCase {
    var networkManager: NetworkManager!
    var mockURLSession: MockURLSession!

    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        networkManager = NetworkManager(session: mockURLSession)
    }
    
    
    override func tearDown() {
        networkManager = nil
        mockURLSession = nil
        super.tearDown()
    }

    func testFetchProductsSuccess() {
        let jsonString = "{\"products\": [{\"id\": 1, \"name\": \"Product1\"}]}"
        mockURLSession.nextData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Success")
        
        networkManager.fetchProducts { result in
            switch result {
            case .success(let products):
                XCTAssertNotNil(products)
                XCTAssertEqual(products.count, 1)
            case .failure:
                XCTFail("Failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
