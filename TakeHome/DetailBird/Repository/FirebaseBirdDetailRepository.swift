//
//  FirebaseBirdDetailRepository.swift
//  TakeHome
//
//  Created by Josue Hernandez on 2024-08-10.
//

import FirebaseAuth
import FirebaseFirestore

protocol BirdDetailRepository {
    func fetchBirdDetails(by birdID: String, completion: @escaping (Result<Bird, Error>) -> Void)
}

class FirebaseBirdDetailRepository: BirdDetailRepository {
    private let firestore = Firestore.firestore()

    func fetchBirdDetails(by birdID: String, completion: @escaping (Result<Bird, Error>) -> Void) {
        let birdDocRef = firestore.collection("birds").document(birdID)
        birdDocRef.getDocument { document, error in
            if let error = error {
                completion(.failure(error))
            } else if let document = document, document.exists {
                do {
                    let bird = try document.data(as: Bird.self)
                    completion(.success(bird))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Bird not found"])))
            }
        }
    }
}
