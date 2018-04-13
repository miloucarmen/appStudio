//
//  ViewController.swift
//  light
//
//  Created by Gebruiker on 13-04-18.
//  Copyright © 2018 Gebruiker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var lightOn = true
    
    @IBAction func pressedButton(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }

    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

