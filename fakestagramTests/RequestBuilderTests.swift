//
//  RequestBuilderTests.swift
//  fakestagramTests
//
//  Created by Jhovan Gallardo on 10/5/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import XCTest
@testable import fakestagram

class RequestBuilderTests: XCTestCase {
    func testBuildValidURL() {
        var builder =  RequestBuilder(baseUrl: "https://fakestagram-api.herokuapp.com")
        builder.path = "/api/v1/accounts"
        XCTAssertEqual(builder.scheme, "https")
        XCTAssertEqual(builder.method, "get")
        XCTAssertEqual(builder.url(), URL(string: "https://fakestagram-api.herokuapp.com/api/v1/accounts")!)
    }
    
    func testBuildInvalidURL() {
        var builder = RequestBuilder(baseUrl: "example.com")
        builder.path = "//@`erw456-123432432"
        XCTAssertNil(builder.url())
    }
    
    func testBuildForceSchemeURL() {
        let builder = RequestBuilder(baseUrl: "https://example.com")
        XCTAssertEqual(builder.url(), URL(string: "https://example.com/")!)
    }
    
    func testBuildOVerrideSchemeURL () {
        var builder = RequestBuilder(baseUrl: "https://example.com/")
        builder.scheme = "ftp"
        XCTAssertEqual(builder.url(), URL(string:"ftp://exmapel.com/"))
    }
    
    func testBuildInvalidRequest() {
        var builder = RequestBuilder(baseUrl: "example.com")
        builder.path = "//@3`-"
        XCTAssertNil(builder.request())
    }
    
    
    func testBuildValidRequest() {
        var builder =  RequestBuilder(baseUrl: "https://example.com/")
        builder.path = "/api/v1/accounts"
        builder.method = "post"
        builder.body = "{\"a\": 1}".data(using: .utf8)
        builder.headers = ["Test": "example"]
        
        let result = builder.request()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!.httpMethod!,"POST")
        XCTAssertEqual(result!.httpBody,"{\"a\": 1}".data(using: .utf8))
        XCTAssertEqual(result!.allHTTPHeaderFields!, ["Accept": "application/json", "Content-Type": "application/json", "test":"example"])
    }
    
    func testBuildValidRequestWithDefaults() {
        var builder =  RequestBuilder(baseUrl: "https://example.com/")
        builder.path = "/api/v1/accounts"
        
        let result = builder.request()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!.httpMethod!,"GET")
        XCTAssertNil(result!.httpBody)
        XCTAssertEqual(result!.allHTTPHeaderFields!, ["Accept": "application/json", "Content-Type": "application/json", "test":"example"])
    }
}
