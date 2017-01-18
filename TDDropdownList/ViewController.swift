//
//  ViewController.swift
//  TDDropdownList
//
//  Created by Emre Duman on 18/01/17.
//  Copyright © 2017 theduman. All rights reserved.
//

import UIKit

class ViewController: UIViewController , TDDropdownListDelegate {
    
    let list = TDDropdownList(frame: CGRect(x:60 , y : 100 , width: 200 , height: 50))
    override func viewDidLoad() {
        list.initialize(data: ["Github","Theduman","Dropdown","List"])
        list.delegate = self
        self.view.addSubview(list)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func listTapped(sender: UIButton) {
        let alert = UIAlertController(title: "TDDropdownList" ,message: "Selected item: \(sender.currentTitle!)", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
}
