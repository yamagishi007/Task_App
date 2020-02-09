//
//  NextViewController.swift
//  TaskApp
//
//  Created by yamagishi on 2020/01/17.
//  Copyright © 2020 yamagishi. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    var todoString = String()
    @IBOutlet var todoLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        todoLabel.text = todoString
        
    }

}

//ナビゲーションバー表示
//override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    navigationController?.isNavigationBarHidden = false
//}
