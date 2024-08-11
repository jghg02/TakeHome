//
//  BirdDetailViewModel.swift
//  TakeHome
//
//  Created by Josue Hernandez on 2024-08-10.
//

import Combine
import Foundation

class BirdDetailViewModel: ObservableObject {
    @Published var bird: Bird
    private let fetchBirdDetailsUseCase: FetchBirdDetailsUseCase
    
    init(bird: Bird, fetchBirdDetailsUseCase: FetchBirdDetailsUseCase) {
        self.bird = bird
        self.fetchBirdDetailsUseCase = fetchBirdDetailsUseCase
    }
    
    func reloadBirdData() {
        fetchBirdDetailsUseCase.execute(birdID: bird.id) { [weak self] result in
            switch result {
            case .success(let bird):
                self?.bird = bird
            case .failure(let error):
                // Handle error
                print("Error reloading bird details: \(error)")
            }
        }
    }
}
