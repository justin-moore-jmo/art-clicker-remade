//
//  ViewController.swift
//  ArtClickerRemade
//
//  Created by Justin.Moore on 4/25/19.
//  Copyright © 2019 Justin.Moore. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLabel.text = String(currentPoints)
        moveForwardButton.alpha = 0
    }
    
    @IBOutlet weak var moveForwardButton: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var pointsPower: Int = 1
    var currentPoints: Int = 0
    
    @IBAction func createPointsButton(_ sender: Any) {
        currentPoints += pointsPower
        pointsLabel.text = String(currentPoints)
        if currentPoints >= 100{
            moveForwardButton.alpha = 1
        }
    }
    
    @IBAction func nextLevelButton(_ sender: Any) {
            if currentPoints >= 100 {
                performSegue(withIdentifier: "SegueToSecondLevel", sender: nil)
        }
    }
}
//------------------------------------------------------------


class SecondLevel: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLabel.text = String(currentPoints)
        artPowerLabel.text = String(artPower)
        print("Second Level Loaded")
        createPointsButtonProperties.alpha = 1
        paintUpgradeLabel.text = String(paintUpgradeCost)
        paintbrushUpgradeLabel.text = String(paintbrushUpgradeCost)
        easelUpgradeLabel.text = String(easelUpgradeCost)
        paintUpgradeButtonProperties.alpha = 1
        progressionLabel.text = String(100000)
        nextLevelButtonProperties.alpha = 0
    }
    var currentPoints: Int = 0
    var artPower: Int = 1
    var paintUpgradeCost: Int = 75
    var paintbrushUpgradeCost: Int = 250
    var easelUpgradeCost: Int = 1000
    var pointsToProgress: Int = 100000
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var paintUpgradeLabel: UILabel!
    @IBOutlet weak var paintbrushUpgradeLabel: UILabel!
    @IBOutlet weak var easelUpgradeLabel: UILabel!
    @IBOutlet weak var artPowerLabel: UILabel!
    @IBOutlet weak var progressionLabel: UILabel!
    @IBOutlet weak var createPointsButtonProperties: UIButton!
    @IBOutlet weak var paintUpgradeButtonProperties: UIButton!
    @IBOutlet weak var nextLevelButtonProperties: UIButton!
    
    @IBAction func createPointsButtonPressed(_ sender: Any) {
        currentPoints += artPower
        pointsLabel.text = String(currentPoints)
        if currentPoints >= pointsToProgress{
            nextLevelButtonProperties.alpha = 1
        }
    }
    @IBAction func paintUpgradeButtonPressed(_ sender: Any) {
        if currentPoints >= paintUpgradeCost{
            artPower += 2
            artPowerLabel.text = String(artPower)
            currentPoints -= paintUpgradeCost
            pointsLabel.text = String(currentPoints)
        }
    }
    
    @IBAction func paintbrushUpgradeButtonPressed(_ sender: Any) {
        if currentPoints >= paintbrushUpgradeCost{
            artPower += 10
            artPowerLabel.text = String(artPower)
            currentPoints -= paintbrushUpgradeCost
            pointsLabel.text = String(currentPoints)
        }
    }
    @IBAction func EaselUpgradeButtonPressed(_ sender: Any) {
        if currentPoints >= easelUpgradeCost{
            artPower += 50
            artPowerLabel.text = String(artPower)
            currentPoints -= easelUpgradeCost
            pointsLabel.text = String(currentPoints)
        }
    }
    
    @IBAction func nextLevelButtonPressed(_ sender: Any) {
        if currentPoints >= pointsToProgress{
            performSegue(withIdentifier: "SegueToThirdLevel", sender: nil)
        }
    }
}
//------------------------------------------------------------

class ThirdLevel: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLabel.text = String(currentPoints)
        artPowerLabel.text = String(artPower)
        print("Third Level Loaded")
        createPointsButtonProperties.alpha = 1
        paintUpgradeLabel.text = String(paintUpgradeCost)
        paintbrushUpgradeLabel.text = String(paintbrushUpgradeCost)
        easelUpgradeLabel.text = String(easelUpgradeCost)
        paintUpgradeButtonProperties.alpha = 1
        progressionLabel.text = String(100000)
        nextLevelButtonProperties.alpha = 0
    }
    var currentPoints: Int = 0
    var artPower: Int = 1
    var paintUpgradeCost: Int = 75
    var paintbrushUpgradeCost: Int = 250
    var easelUpgradeCost: Int = 1000
    var pointsToProgress: Int = 100000
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var paintUpgradeLabel: UILabel!
    @IBOutlet weak var paintbrushUpgradeLabel: UILabel!
    @IBOutlet weak var easelUpgradeLabel: UILabel!
    @IBOutlet weak var artPowerLabel: UILabel!
    @IBOutlet weak var progressionLabel: UILabel!
    @IBOutlet weak var createPointsButtonProperties: UIButton!
    @IBOutlet weak var paintUpgradeButtonProperties: UIButton!
    @IBOutlet weak var nextLevelButtonProperties: UIButton!
    let soundPath = Bundle.main.path(forResource: "click sfx", ofType: "mp3")
    var playSong = AVAudioPlayer()
    
    let soundPath2 = Bundle.main.path(forResource: "upgrade sfx", ofType: "mp3")
    var playSong2 = AVAudioPlayer()
    
    
    @IBAction func createPointsButtonPressed(_ sender: Any) {
        currentPoints += artPower
        pointsLabel.text = String(currentPoints)
        if currentPoints >= pointsToProgress{
            nextLevelButtonProperties.alpha = 1
        }
        do {
            playSong = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath!))
            playSong.play()
        }
        catch{
            print("OH NO!")
        }
    }
    @IBAction func paintUpgradeButtonPressed(_ sender: Any) {
        if currentPoints >= paintUpgradeCost{
            artPower += 2
            artPowerLabel.text = String(artPower)
            currentPoints -= paintUpgradeCost
            pointsLabel.text = String(currentPoints)
            paintUpgradeCost = (paintUpgradeCost * 2) - (paintUpgradeCost/4)
            paintUpgradeLabel.text = String(paintUpgradeCost)
        }
        do {
            playSong2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath2!))
            playSong2.play()
        }
        catch{
            print("OH NO!")
        }
        
    }
    
    @IBAction func paintbrushUpgradeButtonPressed(_ sender: Any) {
        if currentPoints >= paintbrushUpgradeCost{
            artPower += 10
            artPowerLabel.text = String(artPower)
            currentPoints -= paintbrushUpgradeCost
            pointsLabel.text = String(currentPoints)
            paintbrushUpgradeCost = (paintbrushUpgradeCost * 2) - (paintbrushUpgradeCost/4)
            paintbrushUpgradeLabel.text = String(paintbrushUpgradeCost)
        }
        do {
            playSong2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath2!))
            playSong2.play()
        }
        catch{
            print("OH NO!")
        }
    }
    @IBAction func EaselUpgradeButtonPressed(_ sender: Any) {
        if currentPoints >= easelUpgradeCost{
            artPower += 50
            artPowerLabel.text = String(artPower)
            currentPoints -= easelUpgradeCost
            pointsLabel.text = String(currentPoints)
            easelUpgradeCost = (easelUpgradeCost * 2) - (easelUpgradeCost/4)
            easelUpgradeLabel.text = String(easelUpgradeCost)
        }
        do {
            playSong2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath2!))
            playSong2.play()
        }
        catch{
            print("OH NO!")
        }
    }
    
    @IBAction func nextLevelButtonPressed(_ sender: Any) {
        if currentPoints >= pointsToProgress{
            performSegue(withIdentifier: "SegueToFirstLevel", sender: nil)
        }
    }
}
