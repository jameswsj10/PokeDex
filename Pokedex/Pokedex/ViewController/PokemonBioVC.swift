//
//  PokemonBioVC.swift
//  Pokedex
//
//  Created by James Jung on 2/13/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PokemonBioVC: UICollectionViewController {
    var currPokemon: Pokemon = PokemonGenerator.getPokemonArray()[0] // setting as bulbasaur for testing purposes
    
    @IBOutlet weak var PokemonTitle: UILabel!
    @IBOutlet weak var animatedGIF: UIImageView!
    @IBOutlet weak var pokemonDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showPokemonBio()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    func showPokemonBio() {
        PokemonTitle.text = "ID: \(currPokemon.id) \(currPokemon.name)"
        
        let url = URL(string: currPokemon.gifUrl)
        let data = try? Data(contentsOf: url!) // need to fix when nil
        animatedGIF.image = UIImage(data: data!)
        
        pokemonDescription.text = "Type: \(currPokemon.types) Total Stats: \(currPokemon.total) HP: \(currPokemon.health) Attack: \(currPokemon.attack) Defense: \(currPokemon.defense) Sp_attack: \(currPokemon.specialAttack) Sp_defense: \(currPokemon.specialDefense) Speed: \(currPokemon.speed)"
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
