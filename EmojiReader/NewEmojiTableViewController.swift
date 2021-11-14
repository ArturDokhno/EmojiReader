//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Артур Дохно on 14.11.2021.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {

    @IBOutlet var emajiTextField: UITextField!
    @IBOutlet var nameTextField: UIView!
    @IBOutlet var descriotionTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func textChanged(_ sender: Any) {
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
