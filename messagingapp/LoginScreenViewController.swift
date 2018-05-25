//
//  ViewController.swift
//  messagingapp
//
//  Created by user137325 on 5/24/18.
//  Copyright © 2018 Ian Lamothe. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LoginPressed(_ sender: Any) {
        let messageListScreen = self.storyboard?.instantiateViewController(withIdentifier: "messageList")
        self.present(messageListScreen!, animated: true, completion: nil)
    }
    
}

