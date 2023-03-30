//
//  File.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 29/03/2023.
//

import Combine

extension Publisher {
    func sampleOperator<T>(
        source: T
    ) -> AnyPublisher<Output, Failure>where T: Publisher, T.Output: Equatable, T.Failure == Self.Failure {
        combineLatest(source)
            .removeDuplicates { $0.1 == $1.1 }
            .map { $0.0 }
            .eraseToAnyPublisher()
    }
}

