//
//  EmojiTableViewCell.swift
//  EmojiReader
//
//  Created by Артур Дохно on 14.11.2021.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
