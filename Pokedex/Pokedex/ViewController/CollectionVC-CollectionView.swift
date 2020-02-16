//
//  CollectionVC-CollectionView.swift
//  Pokedex
//
//  Created by James Jung on 2/13/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isFiltering {
            self.Pokemon2Send = filteredPokemon[indexPath.item]
        } else {
            self.Pokemon2Send = PokemonManager.getPokemon(pokeIndex: indexPath.item)
        }
        self.currIndexPath = indexPath.item
        performSegue(withIdentifier: "goToPokePage", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        LayOutManager.updateLayout()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
          return filteredPokemon.count
        }
        return PokemonManager.PokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! CollectionViewCell
        let poke: Pokemon
        if isFiltering {
          poke = filteredPokemon[indexPath.item]
          cell.pokemonImage.image = PokemonManager.getImage(pokeList: filteredPokemon, indexPath: indexPath.row)
        } else {
          poke = PokemonManager.getPokemon(pokeIndex: indexPath.item)
          cell.pokemonImage.image = PokemonManager.getImage(indexPath: indexPath.row)
        }
        cell.pokemonName.text = poke.name // 001: Bulbasaur
        cell.pokemonID.text = "ID: \(poke.id)"
        cell.pokeInt = poke.id
        
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.24
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        
        return cell
    }
    
    @IBAction func toggleView(_ sender: Any) {
        LayOutManager.toggleView(currState: toggleSwitch.selectedSegmentIndex)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pokeBio = segue.destination as? PokeBioVC, segue.identifier == "goToPokePage" {
            if isFiltering {
                pokeBio.PokeList = filteredPokemon
            } else {
                pokeBio.PokeList = PokemonManager.PokemonList
            }
            pokeBio.indexpath = self.currIndexPath
            pokeBio.PokemonReceived = Pokemon2Send!
        }
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredPokemon = PokemonManager.PokemonList.filter({( pokemon : Pokemon) -> Bool in
            return pokemon.name.lowercased().contains(searchText.lowercased())
        })
        
        collectionView.reloadData()
    }
    
    var isFiltering: Bool {
        return (searchController.isActive && !isSearchBarEmpty) || (self.typeFiltered && self.filterContentExists)
    }
}
