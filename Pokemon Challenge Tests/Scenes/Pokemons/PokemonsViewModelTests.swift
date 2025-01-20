//
//  PokemonsViewModelTests.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 20/01/25.
//

import XCTest
@testable import Pokemon_Challenge

final class PokemonsViewModelTests: XCTestCase {
    
    private var sut: PokemonsViewModel!
    private var mockService: MockPokemonsService!
    private var mockCoordinator: MockPokemonsCoordinator!
    
    override func setUp() {
        super.setUp()
        mockService = MockPokemonsService()
        mockCoordinator = MockPokemonsCoordinator()
        sut = PokemonsViewModel(service: mockService, coordinator: mockCoordinator)
    }
    
    override func tearDown() {
        sut = nil
        mockService = nil
        mockCoordinator = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_shouldResetOffsetAndPokemons() {
        // Given
        sut.offset = 100
        sut.pokemons = [Species(id: nil, name: "test", url: "test")]
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(sut.offset, 0)
        XCTAssertTrue(sut.pokemons.isEmpty)
    }
    
    func test_getSpecies_whenSuccessful_shouldUpdatePokemons() {
        // Given
        let expectation = XCTestExpectation(description: "Pokemon list updated")
        let mockSpecies = [Species(id: nil, name: "bulbasaur", url: "url1")]
        mockService.mockResult = .success(SpeciesResponse(count: 1, results: mockSpecies))
        
        var updatedPokemons: [Species]?
        sut.onPokemonsUpdated = { pokemons in
            updatedPokemons = pokemons
            expectation.fulfill()
        }
        
        // When
        sut.getSpecies(offset: 0, limit: 20)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(updatedPokemons?.count, 1)
        XCTAssertEqual(updatedPokemons?.first?.name, "bulbasaur")
    }
    
    func test_getSpecies_whenFailure_shouldNotUpdatePokemons() {
        // Given
        mockService.mockResult = .failure(.unknown)
        
        // When
        sut.getSpecies(offset: 0, limit: 20)
        
        // Then
        XCTAssertTrue(sut.pokemons.isEmpty)
    }
    
    func test_getSpecies_withNilOffset_shouldIncrementCurrentOffset() {
        // Given
        sut.offset = 20
        let expectation = XCTestExpectation(description: "Service called")
        
        // When
        sut.getSpecies(offset: nil, limit: nil)
        
        // Then
        XCTAssertEqual(sut.offset, 40)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_getSpecies_withProvidedOffset_shouldUseProvidedOffset() {
        // Given
        sut.offset = 20
        let expectation = XCTestExpectation(description: "Service called")
        
        // When
        sut.getSpecies(offset: 50, limit: nil)
        
        // Then
        XCTAssertEqual(sut.offset, 50)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_goToDetails_shouldCallCoordinator() {
        // Given
        let pokemon = Species(id: nil, name: "pikachu", url: "test-url")
        
        // When
        sut.goToDetails(pokemon: pokemon)
        
        // Then
        XCTAssertEqual(mockCoordinator.pokemonPassedToDetails?.name, "pikachu")
        XCTAssertEqual(mockCoordinator.pokemonPassedToDetails?.url, "test-url")
    }
}

// MARK: - Mocks

private class MockPokemonsService: PokemonsServicing {
    var API: APIRequesting = MockAPIRequests()
    var mockResult: Result<SpeciesResponse, NetworkErrors>?
    
    func getSpecies(offset: Int?, limit: Int?, completion: @escaping (Result<SpeciesResponse, NetworkErrors>) -> Void) {
        if let result = mockResult {
            completion(result)
        }
    }
}

private class MockPokemonsCoordinator: PokemonsCoordinating {
    var controller: UIViewController?
    var pokemonPassedToDetails: Species?
    
    func goToDetails(pokemon: Species) {
        pokemonPassedToDetails = pokemon
    }
}

