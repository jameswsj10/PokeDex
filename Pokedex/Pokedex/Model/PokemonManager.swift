//
//  PokemonManager.swift
//  Pokedex
//
//  Created by James Jung on 2/13/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import UIKit

class PokemonManager {
    var currPokemon: Pokemon?
    static let PokemonList = PokemonGenerator.getPokemonArray()
    static let unknownImage = URL(string: "https://www.publicdomainpictures.net/pictures/40000/velka/question-mark.jpg")
    private init() {
        //yeet
    }
    
    
    static func getImage(indexPath: IndexPath) -> UIImage {
        return getImage(indexPath: indexPath.item)
    }
    
    static func getImage(indexPath: Int) -> UIImage {
        let url = URL(string: PokemonList[indexPath].imageUrl) ?? unknownImage
        let data = try? Data(contentsOf: url!) // sometimes errors out?
        return UIImage(data: data!)!
    }
    
    static func getTitle(indexPath: IndexPath) -> String {
        return "\(PokemonList[indexPath.item].id): \(PokemonList[indexPath.item].name)"
    }
    
    static func getPokemon(pokeIndex: Int) -> Pokemon {
        return PokemonList[pokeIndex]
    }
}



class ToggleItems {
    
}

