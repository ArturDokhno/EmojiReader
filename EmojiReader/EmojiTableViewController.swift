//
//  EmojiTableViewController.swift
//  EmojiReader
//
//  Created by Артур Дохно on 14.11.2021.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var objects = [
        Emoji(emoji: "🥰", name: "Love", description: "Let's love each other", isFavorite: false),
        Emoji(emoji: "⚽️", name: "Football", description: "Let's play football", isFavorite: false),
        Emoji(emoji: "🐱", name: "Cat", description: "Cat is the cutest animal", isFavorite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Emoji Reader"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete // делет релизован по умолчанию вызвали для наглядности
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row) // удаление из массива
            tableView.deleteRows(at: [indexPath], with: .fade) // удаление из таблицы
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true // добавили кнопку движения в ячейку с права
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = objects.remove(at: sourceIndexPath.row) // сохраняем удаленый элемент из массива в константу
        objects.insert(movedEmoji, at: destinationIndexPath.row) // добавляем удаленый элемент в массив в нужном месте
        tableView.reloadData() // перезагружаем таблицу
    }
    
}
