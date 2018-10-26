//
//  ViewController.swift
//  CreateListApp
//
//  Created by 工藤 響 on 2018/10/22.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var InputList: UITextView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func InsertList(_ sender: Any) {
        if appDelegate.Text != nil && InputList.text != ""{
            appDelegate.Text = InputList.text + ",,," + appDelegate.Text!
            
        }else if appDelegate.Text == nil && InputList.text != ""{
            appDelegate.Text = InputList.text
        }
        
        navigationController?.popViewController(animated: true)
        
    }


 
 
}

