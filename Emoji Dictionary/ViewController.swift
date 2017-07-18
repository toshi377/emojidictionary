//
//  ViewController.swift
//  Emoji Dictionary
//
//  Created by 荒井俊洋 on 2017/07/17.
//  Copyright © 2017年 荒井俊洋. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dacooltableview: UITableView!
    
    var emojis : [Emoji] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dacooltableview.dataSource = self
        dacooltableview.delegate = self
        emojis = makeEmojiArray()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = UITableViewCell()
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = emoji.stringEmoji
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let emoji = emojis[indexPath.row]
        performSegue(withIdentifier: "moveSegue", sender: emoji)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defVC = segue.destination as! DefinitionViewController
        defVC.emoji = sender as! Emoji
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func makeEmojiArray() -> [Emoji]{
        let emoji1 = Emoji()
        emoji1.stringEmoji = "😪"
        emoji1.birthYear = 2010
        emoji1.category = "Sleepy"
        emoji1.definition = "Sleepy face"
        
        let emoji2 = Emoji()
        emoji2.stringEmoji = "😍"
        emoji2.birthYear = 1921
        emoji2.category = "Lovin"
        emoji2.definition = "Hoo"
        
        let emoji3 = Emoji()
        emoji3.stringEmoji = "😡"
        emoji3.birthYear = 865
        emoji3.category = "90"
        emoji3.definition = "666"
        
        let emoji4 = Emoji()
        emoji4.stringEmoji = "😎"
        emoji4.birthYear = 1986
        emoji4.category = "Dude"
        emoji4.definition = "Hey"
        
        let emoji5 = Emoji()
        emoji5.stringEmoji = "😘"
        emoji5.birthYear = 2016
        emoji5.category = "Loving"
        emoji5.definition = "love ya"
        
        let emoji6 = Emoji()
        emoji6.stringEmoji = "💩"
        emoji6.birthYear = 2017
        emoji6.category = "Shit"
        emoji6.definition = "Total shit!"
        
        let emoji7 = Emoji()
        emoji7.stringEmoji = "👾"
        emoji7.birthYear = 2908
        emoji7.category = "Unknown"
        emoji7.definition = "Alien"
        
        return [emoji1, emoji2, emoji3,emoji4,emoji5,emoji6,emoji7,]
    }

}
