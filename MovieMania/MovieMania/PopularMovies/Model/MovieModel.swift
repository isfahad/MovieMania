//
//  MovieModel.swift
//  MovieMania
//
//  Created by Fahad Shaikh on 21/04/19.
//  Copyright © 2019 Fahad Shaikh. All rights reserved.
//

struct Movie {
    let id: Int
    let posterPath: String
    let backdrop: String
    let title: String
    let releaseDate: String
    let rating: Double
    let overview: String
}

extension Movie:Codable{
    
}
