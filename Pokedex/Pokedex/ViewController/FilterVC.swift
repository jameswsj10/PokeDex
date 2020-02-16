//
//  FilterVC.swift
//  Pokedex
//
//  Created by James Jung on 2/15/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {
    var switchStates: [String:Bool] = ["Bug":false, "Grass":false, "Dark":false, "Ground":false, "Dragon":false, "Ice":false, "Electric":false, "Normal":false, "Fairy":false, "Poison":false, "Fighting":false, "Psychic":false, "Fire":false, "Rock":false, "Flying":false, "Steel":false, "Ghost":false, "Water":false, "Unknown":false]
    @IBAction func bugSwitch(_ sender: Any) {
        switchStates["Bug"] = !switchStates["Bug"]!
    }
    @IBOutlet weak var bugType: UISwitch!
    @IBAction func grassSwitch(_ sender: Any) {
        switchStates["Grass"] = !switchStates["Grass"]!
    }
    @IBOutlet weak var grassType: UISwitch!
    @IBAction func darkSwitch(_ sender: Any) {
        switchStates["Dark"] = !switchStates["Dark"]!
    }
    @IBOutlet weak var darkType: UISwitch!
    
    @IBAction func groundSwitch(_ sender: Any) {
        switchStates["Ground"] = !switchStates["Ground"]!
    }
    @IBOutlet weak var groundType: UISwitch!
    @IBAction func dragonSwitch(_ sender: Any) {
        switchStates["Dragon"] = !switchStates["Dragon"]!
    }
    @IBOutlet weak var dragonType: UISwitch!
    @IBAction func iceSwitch(_ sender: Any) {
        switchStates["Ice"] = !switchStates["Ice"]!
    }
    @IBOutlet weak var iceType: UISwitch!
    @IBAction func electricSwitch(_ sender: Any) {
        switchStates["Electric"] = !switchStates["Electric"]!
    }
    @IBOutlet weak var electricType: UISwitch!
    @IBAction func normalSwitch(_ sender: Any) {
        switchStates["Normal"] = !switchStates["Normal"]!
    }
    @IBOutlet weak var normalType: UISwitch!
    @IBAction func fairySwitch(_ sender: Any) {
        switchStates["Fairy"] = !switchStates["Fairy"]!
    }
    @IBOutlet weak var fairyType: UISwitch!
    @IBAction func poisonSwitch(_ sender: Any) {
        switchStates["Poison"] = !switchStates["Poison"]!
    }
    @IBOutlet weak var poisonType: UISwitch!
    @IBAction func fightingSwitch(_ sender: Any) {
        switchStates["Fighting"] = !switchStates["Fighting"]!
    }
    @IBOutlet weak var fightingType: UISwitch!
    @IBAction func psychicSwitch(_ sender: Any) {
        switchStates["Psychic"] = !switchStates["Psychic"]!
    }
    @IBOutlet weak var psychicType: UISwitch!
    @IBAction func fireSwitch(_ sender: Any) {
        switchStates["Fire"] = !switchStates["Fire"]!
    }
    @IBOutlet weak var fireType: UISwitch!
    @IBAction func rockSwitch(_ sender: Any) {
        switchStates["Rock"] = !switchStates["Rock"]!
    }
    @IBOutlet weak var rockType: UISwitch!
    @IBAction func flyingSwitch(_ sender: Any) {
        switchStates["Flying"] = !switchStates["Flying"]!
    }
    @IBOutlet weak var flyingType: UISwitch!
    @IBAction func steelSwitch(_ sender: Any) {
        switchStates["Steel"] = !switchStates["Steel"]!
    }
    @IBOutlet weak var steelType: UISwitch!
    @IBAction func ghostSwitch(_ sender: Any) {
        switchStates["Ghost"] = !switchStates["Ghost"]!
    }
    @IBOutlet weak var ghostType: UISwitch!
    @IBAction func waterSwitch(_ sender: Any) {
        switchStates["Water"] = !switchStates["Water"]!
    }
    @IBOutlet weak var waterType: UISwitch!
    @IBAction func unknownSwitch(_ sender: Any) {
        switchStates["Unknown"] = !switchStates["Unknown"]!
    }
    @IBOutlet weak var unknownType: UISwitch!
    
    
    // variables for the points
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func goToRootViewController() {
        guard let a = self.navigationController?.viewControllers[0] as! ViewController? else {
            return
        }
        a.switchStates = self.switchStates
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        goToRootViewController()
    }

}
