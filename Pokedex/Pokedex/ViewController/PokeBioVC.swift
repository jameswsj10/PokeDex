//
//  PokeBioVC.swift
//  Pokedex
//
//  Created by James Jung on 2/13/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import UIKit

class PokeBioVC: UIViewController {

    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeID: UILabel!
    @IBOutlet weak var pokeImage: UIImageView! // didn't wanna erase this cuz i felt like it'd give back error if i do
    @IBOutlet weak var pokeType: UILabel!
    @IBOutlet weak var pokeTotal: UILabel!
    @IBOutlet weak var pokeHP: UILabel!
    @IBOutlet weak var pokeSPA: UILabel!
    @IBOutlet weak var pokeATT: UILabel!
    @IBOutlet weak var pokeSPD: UILabel!
    @IBOutlet weak var pokeDEF: UILabel!
    @IBOutlet weak var pokeSPEED: UILabel!
    @IBOutlet weak var pokeGIF: UIImageView!
    var PokemonReceived: Pokemon?
    var PokeList: [Pokemon]?
    var indexpath: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is what PokeIndex is on BioVC: \(PokemonReceived!.id)")
        showPokemonBio(poke: PokemonReceived!)
        // Do any additional setup after loading the view.
    }
    
    func showPokemonBio(poke: Pokemon) {
        pokeName.text = poke.name
        pokeID.text = "ID: \(poke.id)"
        pokeImage.image = PokemonManager.getImage(pokeList: PokeList!, indexPath: indexpath!)
        pokeType.text = "Type: \(PokemonManager.getPokemonTypes(pokeList: PokeList!, indexpath!))"
        pokeTotal.text = String(poke.total)
        pokeHP.text = String(poke.health)
        pokeSPA.text = String(poke.specialAttack)
        pokeATT.text = String(poke.attack)
        pokeSPD.text = String(poke.specialDefense)
        pokeDEF.text = String(poke.defense)
        pokeSPEED.text = String(poke.speed)
        pokeGIF.image = loadGIF(poke: poke)
        
    }
    
    
    func loadGIF(poke: Pokemon) -> UIImage {
        let gifURL : String = poke.gifUrl
        let unknownImage = PokemonManager.getUnknownImage()
        let gifimage = UIImage.gifImageWithURL(gifURL) ?? unknownImage
        return gifimage
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
