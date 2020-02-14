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
//    var SegRowCGSize = CGSize(width: 200, height: 200)
//    var SegGridCGSize = CGSize(width: view.frame.width / 4, height: view.frame.width / 4)
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.PokeIndex = indexPath.item
        performSegue(withIdentifier: "goToPokePage", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print(view.frame.size)
        return CGSize(width: view.frame.width/2, height: view.frame.width/2)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PokemonManager.PokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! CollectionViewCell
        cell.pokemonImage.image = PokemonManager.getImage(indexPath: indexPath)
        cell.pokemonName.text = PokemonManager.getTitle(indexPath: indexPath) // 001: Bulbasaur
        cell.pokeInt = indexPath.item
        return cell
    }
    
    @IBAction func toggleView(_ sender: Any) {
        switch toggleSwitch.selectedSegmentIndex {
        case 0:
            print("row")
        case 1:
            print("grid")
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pokeBio = segue.destination as? PokeBioVC, segue.identifier == "goToPokePage" {
            pokeBio.PokeIndex = PokeIndex!
        }
    }
}
