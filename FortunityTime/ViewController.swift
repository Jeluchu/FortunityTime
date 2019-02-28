//
//  ViewController.swift
//  BullsEye
//
//  Created by Jesús Calderón on 28/02/2019.
//  Copyright © 2019 Jesús Calderón. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue) // CONVERT FLOAT --> INT
        startNewGame()
        
    }

    // SHOW POPUP ALERT
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
    
        score += points
        
        let title: String
        if difference == 0 {
            title = "¡Perfecto piratejo!"
            points += 100
        } else if difference < 5 {
            title = "¡Casi lo tienes!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Ñe vas mejorando"
        } else {
            title = "Arrrgg mal mal..."
        }
        
        let message = "Has conseguido \(points) puntos"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Oki", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    // SLIDER ACTIONS
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    // ROUND NUMBERS
    func startNewRound() {
        
        round += 1
        targetValue = Int.random(in: 1...100) // RANDOM VALUES
        slider.value = Float(currentValue)
        updateLabels()

    }
    
    // UPDATE LABELS
    func updateLabels() {
        targetLabel.text = String(targetValue) // CHANGE TEXT IN LABEL
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
}

