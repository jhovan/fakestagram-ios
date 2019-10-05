//
//  RequestBuilder.swift
//  fakestagram
//
//  Created by Jhovan Gallardo on 10/5/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

struct RequestBuilder {
    
    enum ContentMode {
        case jsonApp
        
        func accept() -> String {
            switch self {
            case.jsonApp:
                return "application/json"
            }
        }
        
        func contentType() -> String {
            switch self {
            case .jsonApp:
                return "application/json"
            }
        }
    }
    
    public var path: String = "/"
    public var scheme: String = "https"
    public var method: String = "get"
    public let urlComponents: URLComponents
    public var body: Data?
    public var headers: [String:String]?
    public var contentMode: ContentMode = .jsonApp
    
    init(baseUrl: String) {
        self.urlComponents = URLComponents(string: baseUrl)!
    }
    
    func url() -> URL?{
        var urlComponentsAux = self.urlComponents
        urlComponentsAux.scheme = self.scheme
        urlComponentsAux.path = self.path
        return urlComponentsAux.url
    }
    
    func request() -> URLRequest? {
        guard let url =  url() else {return nil}
        var req = URLRequest(url:url)
        req.httpMethod = method
        req.httpBody = body
        req.addValue(contentMode.accept(), forHTTPHeaderField: "Accept")
        req.addValue(contentMode.contentType(), forHTTPHeaderField: "Content-Type")
        if let headers = self.headers{
            for(key, value) in headers {
                req.addValue(value, forHTTPHeaderField: key)
            }
        }
        return req
    }
}
