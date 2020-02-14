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
    var PokeIndex: Int? // to send to pokeBio view SET TO 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
    }
}

