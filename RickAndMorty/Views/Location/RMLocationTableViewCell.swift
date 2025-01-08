//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 08.01.2025.
//

import UIKit

final class RMLocationTableViewCell: UITableViewCell {

    static let cellIdentifier = "RMLocationTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    public func configure(with viewModel: RMLocationTableViewCellViewModel) {

    }
}
