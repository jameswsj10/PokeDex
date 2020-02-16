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
    
    // for calling on filtered pokelists
    static func getImage(pokeList: [Pokemon], indexPath: Int) -> UIImage {
    guard let url = try? URL(string: pokeList[indexPath].imageUrl) else {
        return getUnknownImage()
        }
    guard let data = try? Data(contentsOf: url) else {
        return getUnknownImage()
        }
    return UIImage(data: data)!
    }
    
    static func getImage(indexPath: IndexPath) -> UIImage {
        return getImage(indexPath: indexPath.item)
    }
    
    static func getImage(indexPath: Int) -> UIImage {
        guard let url = try? URL(string: PokemonList[indexPath].imageUrl) else {
            return getUnknownImage()
        }
        guard let data = try? Data(contentsOf: url) else {
            return getUnknownImage()
        }
        return UIImage(data: data)!
//        let url = try? URL(string: PokemonList[indexPath].imageUrl) ?? unknownImage
//        let data = try? Data(contentsOf: url!)
//        return UIImage(data: data!)!
    }
    
    static func getUnknownImage() -> UIImage {
        let data = try! Data(contentsOf: PokemonManager.unknownImage!)
        return UIImage(data: data)!
    }
    
    static func getTitle(indexPath: IndexPath) -> String {
        return "\(PokemonList[indexPath.item].id): \(PokemonList[indexPath.item].name)"
    }
    
    static func getID(indexPath: IndexPath) -> String {
        return String((PokemonList[indexPath.item].id))
    }
    
    
    static func getPokemon(pokeIndex: Int) -> Pokemon {
        return PokemonList[pokeIndex]
    }
    
    static func getPokemonTypes(pokeList: [Pokemon], _ IndexPath:Int) -> String {
        var typeString: String = ""
        for type in pokeList[IndexPath].types {
            typeString.append("\(type.rawValue) ")
        }
        return typeString
    }
    
    static func getPokemonTypesL(pokeList: [Pokemon], _ IndexPath:Int) -> [String] {
        var typeList: [String] = []
        for type in pokeList[IndexPath].types {
            typeList.append("\(type.rawValue) ")
        }
        return typeList
    }
    
}
