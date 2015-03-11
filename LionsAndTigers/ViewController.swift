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
    @IBOutlet weak var randomFact: UILabel!
    
    var myTigers:[Tiger] = []
    var lions: [Lion] = []
    var lionCubs: [LionCub] = []
    
    var lastRandomNumber = 0
    var currentAnimal = (species: "Tiger", index : 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.age = 9
        myTiger.name = "Laura"
        myTiger.breed = "Bengalischer Tiger"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoad: false)
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
       
        myTigers.append(myTiger)
        
        println("Mein Tiger heißt \(myTiger.name). Er ist ein \(myTiger.breed) und \(myTiger.age) Jahre alt. Sein Bild heißt \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        self.randomFact.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tine"
        secondTiger.breed = "Indischer Tiger"
        secondTiger.age = 42
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        secondTiger.chuffANumberOfTimes(4)
        
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
        
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        myTigers += [secondTiger, thirdTiger,fourthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named:"Lion.jpg")
        lion.name = "Lothar"
        lion.subspecies = "West Afrikanisch"
        lion.changeToAlphaMale()
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Inge"
        lioness.subspecies = "Berber"
        
        self.lions += [lion, lioness]
        
        lion.roar()
        lioness.roar()
        
        var lionCub = LionCub()
        lionCub.age = 3
        lionCub.name = "Rüdiger"
        lionCub.image = UIImage(named:"LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale=true
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 2
        femaleLionCub.name = "Reinhild"
        femaleLionCub.image = UIImage(named:"LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale=false
        
        self.lionCubs += [lionCub,femaleLionCub]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
    
    }
    
    func updateAnimal (){
        switch currentAnimal {
        case ("Tiger", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default :
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView() {
       
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            var myColor = UIColor.whiteColor()
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFact.text = tiger.randomFact()
                if self.currentAnimal.index == 3 {
                    myColor = UIColor.blackColor()
                }
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFact.text = lion.randomFact()
            }
            else if self.currentAnimal.species == "LionCub" {
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subspecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                self.randomFact.text = lionCub.randomFact()
            }
            self.randomFact.hidden = false
            self.breedLabel.textColor = myColor
            self.ageLabel.textColor = myColor
            self.nameLabel.textColor = myColor
            self.randomFact.textColor = myColor
            }, completion: { (finished: Bool) -> () in }
        )
    }
}

