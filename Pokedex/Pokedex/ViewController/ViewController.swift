//
//  ViewController.swift
//  Pokedex
//
//  Created by James Jung on 2/11/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toggleSwitch: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var Pokemon2Send: Pokemon? // to send to pokeBio view
    let searchController = UISearchController(searchResultsController: nil)
    var filteredPokemon = [Pokemon]()
    var currIndexPath: Int?
    var currPokeList = [Pokemon]()
    var TrueKeys: Set = [""]
    var typeFiltered: Bool = false
    var filterContentExists: Bool = false
    @IBAction func advancedSearch(_ sender: Any) {
        typeFiltered = false
        filterContentExists = false
    }
    var switchStates = [String:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self

        // adding in parameters for searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Pokemon Name"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        self.searchController.isActive = true
        definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        filterContentForType(switchStates)
    }
    
    func filterContentForType(_ dict: [String:Bool]) {
        filteredPokemon = PokemonManager.PokemonList.filter { (pokemon: Pokemon) -> Bool in
            for type in pokemon.types {
                if (dict[type.rawValue] == Optional(true)){
                    return true
                }
            }
            return false
        }
        if filteredPokemon.capacity != 0 {
            self.filterContentExists = true
        }
        typeFiltered = true
        collectionView.reloadData()
    }
}

