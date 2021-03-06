//
//  FeaturedPresenterTest.swift
//  TMDbCoreTests
//
//  Created by Carlos on 12/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import XCTest
@testable import TMDbCore

class FeaturedPresenterTest: XCTestCase {
    
    var sut: FeaturedPresenter!
    
    // Collaborators
    var detailNavigatorMock: DetailNavigatorMock!
    var featuredRepositoryMock: FeaturedRepositoryMock!

    override func setUp() {
        super.setUp()
        
        detailNavigatorMock = DetailNavigatorMock()
        featuredRepositoryMock = FeaturedRepositoryMock()
        sut = FeaturedPresenter(detailNavigator: detailNavigatorMock,
                                repository: featuredRepositoryMock)
    }
    
    func testFeaturedPresenter_didSelectShow_navigatesToShow() {
        // Given
        let show = Show(identifier: 42,
                        title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        firstAirDate: nil,
                        genreIdentifiers: nil)
        
        // When
        sut.didSelect(show: show)
        
        // Then
        XCTAssertTrue(detailNavigatorMock.showDetailCalled)
        
        let (identifier, mediaType) = detailNavigatorMock.showDetailParameters!
        XCTAssertEqual(42, identifier)
        XCTAssertEqual(.show, mediaType)
    }
    
    func testFeaturedPresenter_didSelectMovie_navigatesToMovie() {
        // Given
        let movie = Movie(identifier: 330459,
                        title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        releaseDate: nil,
                        genreIdentifiers: nil)
        
        // When
        sut.didSelect(movie: movie)
        
        // Then
        XCTAssertTrue(detailNavigatorMock.showDetailCalled)
        
        let (identifier, mediaType) = detailNavigatorMock.showDetailParameters!
        XCTAssertEqual(330459, identifier)
        XCTAssertEqual(.movie, mediaType)
    }
    
}

