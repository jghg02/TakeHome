//
//  FetchBirdDetailsUseCase.swift
//  TakeHome
//
//  Created by Josue Hernandez on 2024-08-10.
//

protocol FetchBirdDetailsUseCase {
    func execute(birdID: String, completion: @escaping (Result<Bird, Error>) -> Void)
}

class FetchBirdDetailsUseCaseImpl: FetchBirdDetailsUseCase {
    private let repository: BirdDetailRepository
    
    init(repository: BirdDetailRepository) {
        self.repository = repository
    }
    
    func execute(birdID: String, completion: @escaping (Result<Bird, Error>) -> Void) {
        repository.fetchBirdDetails(by: birdID, completion: completion)
    }
}
