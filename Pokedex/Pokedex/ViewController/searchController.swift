//
//  searchController.swift
//  Pokedex
//
//  Created by James Jung on 2/14/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import UIKit

class searchController: UIViewController {
    var pokemonList = PokemonManager.PokemonList
    var filteredCandies: [Pokemon] = []

    let searchController = UISearchController(searchResultsController: nil)


    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        // Do any additional setup after loading the view.
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String) {
        filteredCandies = pokemonList.filter { (pokemon: Pokemon) -> Bool in
            return pokemon.name.lowercased().contains(searchText.lowercased())
      }
      
      .reloadData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension searchController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}
