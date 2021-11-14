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
        objects.insert(movedEmoji, at: destinationIndexPath.row) // добавляем удаленый элемент в массив в нужном месте таблицы
        tableView.reloadData() // перезагружаем таблицу для отображения перемещения
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = donection(at: indexPath) // создаем константу в которую передаем функциию с работой по индуксу ячейки
        let fovourite = fovouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done, fovourite]) 
    }
    
    func donection(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") {
            (action, view, completion) in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true) // указываем что дейсвие с кнопкой завершается
        }
        action.backgroundColor = .systemGreen // устанавливем цвет кнопки
        action.image = UIImage(systemName: "checkmark.circle") // устанавливаем картинку кнопки
        return action
    }
    
    func fovouriteAction( at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row] // достаем обьект из массива
        let action = UIContextualAction(style: .normal, title: "Favourite") {
            (action, view, completion) in
            object.isFavorite = !object.isFavorite // меняем его свойство на обратное значение
            self.objects[indexPath.row] = object // заменяем в массиве элемент на новый измененный
            completion(true)
        }
        action.backgroundColor = object.isFavorite ? .systemPurple : .systemGray // меняем цвет в зависимости от значения isFavorite
        action.image = UIImage(systemName: "heart")
        return action
    }
    
}
