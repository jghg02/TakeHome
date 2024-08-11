//
//  MainCoordinator.swift
//  TakeHome
//
//  Created by Josue Hernandez on 2024-08-09.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let repository = FirebaseBirdRepository()
        let fetchBirdsUseCase = FetchBirdsUseCase(repository: repository)
        let viewModel = BirdsViewModel(fetchBirdsUseCase: fetchBirdsUseCase)
        let mainViewController = MainViewController()
        mainViewController.viewModel = viewModel
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func presentBirdDetailSheet(for bird: Bird) {
        let detailViewController = BirdDetailViewController()
        let repository = FirebaseBirdDetailRepository()
        let fetchDetailBirdUseCases = FetchBirdDetailsUseCaseImpl(repository: repository)
        let viewModel = BirdDetailViewModel(bird: bird, fetchBirdDetailsUseCase: fetchDetailBirdUseCases)
        detailViewController.bird = bird
        detailViewController.viewModel = viewModel
        detailViewController.coordinator = self
        detailViewController.modalPresentationStyle = .pageSheet
        navigationController.present(detailViewController, animated: true, completion: nil)
    }
}
