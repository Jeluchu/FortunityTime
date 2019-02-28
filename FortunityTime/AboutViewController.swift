//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Jesús Calderón on 28/02/2019.
//  Copyright © 2019 Jesús Calderón. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func github() {
        UIApplication.shared.openURL(NSURL(string: "https://www.github.com/jeluchu")! as URL)
    }
    
}
