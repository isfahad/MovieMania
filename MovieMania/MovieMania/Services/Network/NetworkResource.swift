//
//  NetworkResource.swift
//  MovieMania
//
//  Created by Fahad Shaikh on 21/04/19.
//  Copyright © 2019 Fahad Shaikh. All rights reserved.
//

import Foundation
struct EndPoint{
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let apiKey = "b075628b25d7e75b3c1429e1d68ac100"
    static let imageBaseUrl = "http://image.tmdb.org/t/p/w154/"
}
struct Resource {
    let path: String
    let method: String = "GET"
    let queryParams:[String:String]
    let headers:[String:String] = [:]
    let type:ResourceType = .data
}

enum ResourceType:Int{
    case data
    case image
}
enum Result<T> {
    case success(T)
    case failure(Error)
}

enum APIClientError: Error {
    case noData
}

extension URLRequest {
    init(_ resource: Resource) {
        var urlComponents:URLComponents!
        if resource.type == .image{
            urlComponents = URLComponents(string: EndPoint.imageBaseUrl + resource.path)
        }
        else{
            urlComponents = URLComponents(string: EndPoint.baseUrl + resource.path)
            resource.queryParams.forEach{(key,value) in
                urlComponents?.queryItems?.append(URLQueryItem(name: key, value: value))
            }
            urlComponents?.queryItems?.append(URLQueryItem(name: "api_key", value: EndPoint.apiKey))
            urlComponents?.queryItems?.append(URLQueryItem(name: "language", value:"en-US"))
        }
        guard let url = urlComponents?.url else{
            fatalError("request Url is invalid")
        }
        self.init(url: url)
        self.httpMethod = resource.method
        self.allHTTPHeaderFields = resource.headers
    }
}
