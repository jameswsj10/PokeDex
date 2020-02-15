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
}

