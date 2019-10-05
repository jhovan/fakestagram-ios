//
//  Client.swift
//  fakestagram
//
//  Created by Jhovan Gallardo on 10/4/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class Client {
    
    static let fakestagram =  Client(session: URLSession.shared, baseUrl: "https://fakestragram-api-herokuapp.com")
    let session: URLSession
    let baseUrl: URL
    
    init(session: URLSession, baseUrl: URL) {
        self.session = session
        self.baseUrl = baseUrl
    }
    
    typealias successfulResponse = (Data?) -> Void
    
    func get(path: String, success: @escaping successfulResponse) {
        request(method: "get", path: path, body: nil, success: success)
    }
    
    func post(path: String, body: Data?, success: @escaping successfulResponse) {
        request(method: "post", path: path, body: body, success: success)
    }
    
    func put(path: String, body: Data?, success: @escaping successfulResponse) {
        request(method: "put", path: path, body: body, success: success)
    }
    
    func delete(path: String, success: @escaping successfulResponse) {
        request(method: "delete", path: path, body: nil, success: success)
    }
    
    private func request(method: String, path: String, body: Data?, success: @escaping successfulResponse) {
        //let req = buildRequest(method: method, path: path, body: body)
        
        guard let req = buildRequest(method: method, path: path, body: body) else {
            debugPrint("Invalid request")
            return
        }
        
        session.dataTask(with: req) { (data, response, error) in
            if let error = error {
                debugPrint(error)
                return
            }
            
            let response = HttpResponse(response: response)
            if response.isSuccessful() {
                success(data)
            }
        }.resume()
    }
    
    private func buildRequest(method: String, path: String, body: Data?) -> URLRequest {
        var builder = RequestBuiolder(baseUrl: self.baseUrl)
        builder.method = method
        builder.path = path
        builder.body = body
        if let token = Credentials.apiToken.get() {
            builder.headers =
        }
        
        var urlComponents = URLComponents(url: self.baseUrl, resolvingAgainstBaseURL: true)!
        urlComponents.path = path
        var request = URLRequest(url: urlComponents.url!)
        request.setValue(contentType, forHTTPHeaderField: "Accept")
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        request.httpMethod = method
        if let token = Credentials.apiToken.get() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = body
        
        return request
    }
}
