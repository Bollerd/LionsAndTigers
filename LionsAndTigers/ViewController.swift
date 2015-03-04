//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Dirk Boller on 04.03.15.
//  Copyright (c) 2015 Dirk Boller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.age = 3
        myTiger.name = "Laura"
        myTiger.breed = "Bengalischer Tiger"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        println("Mein Tiger heißt \(myTiger.name). Er ist ein \(myTiger.breed) und \(myTiger.age) Jahre alt. Sein Bild heißt \(myTiger.image)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
    }
    
}

