//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Артур Дохно on 14.11.2021.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "",
                      name: "",
                      description: "",
                      isFavorite: false)

    @IBOutlet var emojiTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriotionTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSaveButtonState()
    }
    
    private func updateSaveButtonState() {
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriotionText = descriotionTextField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriotionText.isEmpty
    }
    
    @IBAction func textChanged(_ sender: Any) {
        updateSaveButtonState()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emoji = emojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let descriotion = descriotionTextField.text ?? ""
        
        self.emoji = Emoji(emoji: emoji,
                           name: name,
                           description: descriotion,
                           isFavorite: self.emoji.isFavorite)
    }
    
}
