//
//  DetailsViewModelTests.swift
//  Pokemon Challenge Tests
//
//  Created by Evens Taian on 20/01/25.
//

import XCTest
@testable import Pokemon_Challenge

final class DetailsViewModelTests: XCTestCase {
    var sut: DetailsViewModel!
    var mockService: MockDetailsService!
    var mockAPI: MockAPIRequests!
    
    override func setUp() {
        super.setUp()
        mockAPI = MockAPIRequests()
        mockService = MockDetailsService(API: mockAPI)
        
        let pokemon = Species(id: 1, name: "bulbasaur", url: "https://url")
        sut = DetailsViewModel(pokemon: pokemon, service: mockService)
    }
    
    override func tearDown() {
        sut = nil
        mockService = nil
        mockAPI = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_shouldCallGetSpeciesDetails() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockService.getSpeciesDetailsCalled, "getSpeciesDetails should be called when viewDidLoad is called")
    }
    
    func test_getSpeciesDetails_whenSuccessful_shouldCallEvolutionChain() {
        // Given
        var evolutionChainCalled = false
        sut.onEvolutionChainDetailsUpdated = { _ in
            evolutionChainCalled = true
        }
        
        // When
        sut.getSpeciesDetails(id: 1)
        
        // Then
        XCTAssertTrue(evolutionChainCalled, "Should have called evolution chain after getting species details")
    }
    
    func test_getSpeciesDetails_whenIdIsNil_shouldNotCallService() {
        // When
        sut.getSpeciesDetails(id: nil)
        
        // Then
        XCTAssertFalse(mockService.getSpeciesDetailsCalled, "Service should not be called when ID is nil")
    }
    
    func test_getSpeciesDetails_shouldReturnCorrectData() {
        // Given
        var receivedDetails: SpeciesDetails?
        sut.onDetailsUpdated = { details in
            receivedDetails = details
        }
        
        // When
        sut.getSpeciesDetails(id: 1)
        
        // Then
        XCTAssertNotNil(receivedDetails)
        XCTAssertEqual(receivedDetails?.name, "bulbasaur")
        XCTAssertEqual(receivedDetails?.base_happiness, 50)
        XCTAssertEqual(receivedDetails?.capture_rate, 45)
        XCTAssertEqual(receivedDetails?.color.name, "green")
        XCTAssertEqual(receivedDetails?.is_legendary, false)
        XCTAssertEqual(receivedDetails?.is_mythical, false)
    }
    
    func test_getEvolutionChain_whenUrlIsNil_shouldNotCallService() {
        // When
        sut.getEvolutionChain(urlString: nil)
        
        // Then
        XCTAssertFalse(mockService.getEvolutionChainDetailsCalled, "Service should not be called when URL is nil")
    }
    
    func test_getEvolutionChain_shouldReturnCorrectData() {
        // Given
        var receivedEvolutionChain: EvolutionChainDetails?
        sut.onEvolutionChainDetailsUpdated = { details in
            receivedEvolutionChain = details
        }
        
        // When
        sut.getEvolutionChain(urlString: "https://pokeapi.co/api/v2/evolution-chain/1/")
        
        // Then
        XCTAssertNotNil(receivedEvolutionChain)
        XCTAssertEqual(receivedEvolutionChain?.chain.species.name, "bulbasaur")
        XCTAssertEqual(receivedEvolutionChain?.chain.evolvesTo.first?.species.name, "ivysaur")
        XCTAssertEqual(receivedEvolutionChain?.chain.evolvesTo.first?.evolvesTo.first?.species.name, "venusaur")
    }
}

// MARK: - Mocks

class MockDetailsService: DetailsServicing {
    var API: APIRequesting
    var getSpeciesDetailsCalled = false
    var getEvolutionChainDetailsCalled = false
    
    init(API: APIRequesting) {
        self.API = API
    }
    
    func getSpeciesDetails(id: Int, completion: @escaping (Result<SpeciesDetails, NetworkErrors>) -> Void) {
        getSpeciesDetailsCalled = true
        API.getSpeciesDetails(id: id, completion: completion)
    }
    
    func getEvolutionChainDetails(urlString: String, completion: @escaping (Result<EvolutionChainDetails, NetworkErrors>) -> Void) {
        getEvolutionChainDetailsCalled = true
        API.getEvolutionChain(urlString: urlString, completion: completion)
    }
}

