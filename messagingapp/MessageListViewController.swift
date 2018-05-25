//
//  MessageListViewController.swift
//  messagingapp
//
//  Created by user137325 on 5/24/18.
//  Copyright © 2018 Ian Lamothe. All rights reserved.
//

import UIKit
import Firebase

class MessageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var messageListTableView: UITableView!
    
    var ref: DatabaseReference!
    var messages : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        messageListTableView.delegate = self
        messageListTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        ref = Database.database().reference()
        
        ref.child("messages").observe(DataEventType.value, with: { (snapshot) in
            self.messages.removeAll()
            
            let dictionary = snapshot.value as? [String: Any]
            
            dictionary?.forEach({ (arg) in
                let (key, value) = arg
                self.messages.append(value as! String)
            })
            
            self.messageListTableView.reloadData()
            
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func addPressed(_ sender: Any) {
        let messageEditorScreen = self.storyboard?.instantiateViewController(withIdentifier: "messageEditor")
        self.present(messageEditorScreen!, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
}
