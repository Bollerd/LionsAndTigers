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
    
    var myTigers:[Tiger] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.age = 9
        myTiger.name = "Laura"
        myTiger.breed = "Bengalischer Tiger"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTigers.append(myTiger)
        
        println("Mein Tiger heißt \(myTiger.name). Er ist ein \(myTiger.breed) und \(myTiger.age) Jahre alt. Sein Bild heißt \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        
        var secondTiger = Tiger()
        secondTiger.name = "Tine"
        secondTiger.breed = "Indischer Tiger"
        secondTiger.age = 42
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Lars"
        thirdTiger.breed = "Malaysischer Tiger"
        thirdTiger.age = 11
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Dirk"
        fourthTiger.breed = "Sibirischer Tiger"
        fourthTiger.age = 43
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        
        myTigers += [secondTiger, thirdTiger,fourthTiger]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        let tiger = myTigers[randomIndex]
        myImageView.image = tiger.image
        nameLabel.text = tiger.name
        ageLabel.text = "\(tiger.age)"
        breedLabel.text = tiger.breed
        
        if randomIndex == 3 {
            ageLabel.textColor = UIColor.blackColor()
            breedLabel.textColor = UIColor.blackColor()
            nameLabel.textColor = UIColor.blackColor()
        } else {
            ageLabel.textColor = UIColor.whiteColor()
            breedLabel.textColor = UIColor.whiteColor()
            nameLabel.textColor = UIColor.whiteColor()
        }
    }
    
}

