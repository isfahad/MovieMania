//
//  PopularMoviesViewModel.swift
//  MovieMania
//
//  Created by Fahad Shaikh on 21/04/19.
//  Copyright © 2019 Fahad Shaikh. All rights reserved.
//

import Foundation
class PopularMoviesViewModel{
    var networkTask:NetworkTask
    init(_ networkTask:NetworkTask) {
        self.networkTask = networkTask
    }
    
    func fetchPopularMovies(){
        let resource = Resource(path: "/movie/popular", queryParams: ["page":"1"])
        self.networkTask.fetch(resource){result in
            switch result{
                
            case .success(let movie):
                return
            case .failure(let error):
                return
            }
        }
    }
}
