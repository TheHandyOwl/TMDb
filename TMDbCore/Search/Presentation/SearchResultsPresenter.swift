//
//  SearchResultsPresenter.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

/// Presents search results
final class SearchResultsPresenter {
    
    private let detailNavigator: DetailNavigator
    private let repository: SearchResultsRepositoryProtocol

	/// The search query
	let query = Variable("")

	/// The search results
	//private(set) lazy var searchResults: Observable<[SearchResult]> = Observable
    private(set) lazy var searchResults: Observable<[SearchResult]> = query.asObservable()
        .distinctUntilChanged()
        //.debug() // Saldrá todo lo que tecleemos por consola
        .debounce(0.3, scheduler: MainScheduler.instance)
        //.debug() // Tras el debounce sómo muestra los textos para las búsquedas por consola y no todo lo que teclea
        .flatMapLatest { [weak self] query -> Observable<[SearchResult]> in
            // Vamos a esperar a que el usuario teclee al menos 2 letras y devolveremos un array vacío si es menos
            // Self no nulo y caracteres mayor que 2, si es menos entra en el guard / else
            guard let `self` = self,
                query.characters.count >= 2 else {
                return Observable.just([])
            }
            
            return self.repository.searchResults(withQuery: query, page: 1)
        }
        .share()
        .observeOn(MainScheduler.instance)

    init(detailNavigator: DetailNavigator, repository: SearchResultsRepositoryProtocol) {
        self.detailNavigator = detailNavigator
        self.repository = repository
    }
    
	/// Called by the view when the user selects a search result
	func didSelect(searchResult: SearchResult) {
		// TODO: implement
        switch searchResult {
        case .movie(let movie):
            detailNavigator.showDetail(withIdentifier: movie.identifier, mediaType: .movie)
        case .show(let show):
            detailNavigator.showDetail(withIdentifier: show.identifier, mediaType: .show)
        case .person(let person):
            detailNavigator.showDetail(withIdentifier: person.identifier, mediaType: .person)
        }
	}
}
