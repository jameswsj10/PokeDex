//
//  CollectionViewCell.swift
//  Pokedex
//
//  Created by James Jung on 2/13/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    var pokeInt: Int?
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? PokeBioVC, segue.identifier == "goToPokePage" {
            destinationVC.pokeIndex = pokeInt
        }
    }
}
