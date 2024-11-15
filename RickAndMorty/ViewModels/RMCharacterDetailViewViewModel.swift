//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 15.11.2024.
//

import Foundation

final class RMCharacterDetailViewViewModel {

    private let character: RMCharacter

    init(character: RMCharacter) {
        self.character = character
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var title: String {
        character.name.uppercased()
    }
}
