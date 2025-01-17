//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 08.01.2025.
//

import Foundation

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config

    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?
    private var searchText = ""
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]

    // MARK: - Init

    init(config: RMSearchViewController.Config) {
        self.config = config
    }

    // MARK: - Public

    public func executeSearch() {
        // create request based on filters
        //send API CALL
        // notify view of results, no results, or error
    }

    public func set(query text: String) {
        self.searchText = text
    }

    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }

    public func registerOptionChangeBlock(
        _ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void) {
            self.optionMapUpdateBlock = block
    }
}
