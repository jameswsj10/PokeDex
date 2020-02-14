//
//  PokeBioVC.swift
//  Pokedex
//
//  Created by James Jung on 2/13/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import UIKit

class PokeBioVC: UIViewController {

//    var currPokemon: Pokemon = PokemonGenerator.getPokemonArray()[0] // setting as bulbasaur for testing purposes
    var pokeIndex: Int? //get from prepare function from collectioncell
    var currPokemon: Pokemon?
    @IBOutlet weak var pokeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPokemonBio(pokeIndex: pokeIndex!)
        // Do any additional setup after loading the view.
    }
    
    func showPokemonBio(pokeIndex: Int) {
        currPokemon = PokemonManager.getPokemon(pokeIndex: pokeIndex)
        pokeImage.image = PokemonManager.getImage(indexPath: pokeIndex)
    }
    
//    func showPokemonBio() {
//        PokemonTitle.text = "ID: \(currPokemon.id) \(currPokemon.name)"
//
//        let url = URL(string: currPokemon.gifUrl)
//        let data = try? Data(contentsOf: url!) // need to fix when nil
//        PokemonGIF.image = UIImage(data: data!)
//
//        PokemonDescription.text = "Type: \(currPokemon.types) Total Stats: \(currPokemon.total) HP: \(currPokemon.health) Attack: \(currPokemon.attack) Defense: \(currPokemon.defense) Sp_attack: \(currPokemon.specialAttack) Sp_defense: \(currPokemon.specialDefense) Speed: \(currPokemon.speed)"
//    }
    
//    func loadGIF() {
//        let imageURL = UIImage.animatedImage(with: <#T##[UIImage]#>, duration: <#T##TimeInterval#>) // ASK FOR HELP
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
