//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 13.12.2024.
//

import UIKit

final class RMEpisodeDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
