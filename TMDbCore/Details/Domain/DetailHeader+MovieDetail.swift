//
//  DetailHeader+MovieDetail.swift
//  TMDbCore
//
//  Created by Carlos on 8/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(movie: MovieDetail, dateFormatter: DateFormatter) {
        title = movie.title
        posterPath = movie.posterPath
        backdropPath = movie.backdropPath
        
        let releaseDate = movie.releaseDate.flatMap { dateFormatter.date(from: $0) } // con .map obtendríamos un opcional-opcional de date
        let year = (releaseDate?.year).map { String($0) } // Con el paréntesis se devuelve un opcional, de manera que no se trabaja sobre el entero sino con la cadena que se devuelve
        let duration = "\(movie.runtime) min."
        
        metadata = [year, duration].flatMap { $0 }.joined(separator: " - ")
    }
}
