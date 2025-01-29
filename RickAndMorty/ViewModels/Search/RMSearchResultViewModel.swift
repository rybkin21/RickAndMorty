//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 29.01.2025.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
