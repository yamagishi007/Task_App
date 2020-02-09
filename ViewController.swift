//
//  ViewController.swift
//  TaskApp
//
//  Created by yamagishi on 2020/01/17.
//  Copyright © 2020 yamagishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    
    @IBOutlet var textfield: UITextField!
    
    @IBOutlet var tableview: UITableView!
    
    var textArray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        textfield.delegate = self
    }
    
    //ナビゲーションバー非表示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textArray.count
    }
   

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = textArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.red
        cell.textLabel?.font = UIFont(name: "Bodoni", size: 28)
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //タップ時に配列の中身の値を返す
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        
        nextVC.todoString = textArray[indexPath.row]
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/10
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textArray.append(textfield.text!)
        textfield.resignFirstResponder()
        textfield.text = ""
        tableview.reloadData()
        
        return true
    }
}
