//
//  TableViewController.swift
//  CreateListApp
//
//  Created by 工藤 響 on 2018/10/22.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit

class TableViewController2: UITableViewController {
    
    var sendText: [String]?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if appDelegate.Text != nil{
            sendText = appDelegate.Text!.components(separatedBy:",,,")
            appDelegate.Text = sendText!.joined(separator: ",,,")
            if sendText!.last == ""{
            sendText?.removeLast()
            }
            print(appDelegate.Text!)
            print(sendText!)
        }else{
            self.performSegue(withIdentifier: "toAdd", sender: nil)
        }
        

        self.title = "リスト"
        let backButtonItem = UIBarButtonItem(title: "戻る", style: .plain, target: nil, action:nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        let rightbtn  = UIBarButtonItem(title: "追加", style: .plain, target: self, action: #selector(self.rightButtonTouch))
        
        let reloadbtn = UIBarButtonItem(title:"更新",style: .plain,target: self,action:#selector(self.reloadtouch))
        self.navigationItem.rightBarButtonItems = [rightbtn,reloadbtn]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadView()
        viewDidLoad()
    }
    
    @objc func reloadtouch(_ sender: Any){
        loadView()
        viewDidLoad()
    }

   
    @objc func rightButtonTouch(_ sender: Any){
        self.performSegue(withIdentifier: "toAdd", sender: nil)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

            return sendText!.count
 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lists", for: indexPath)

        cell.textLabel?.text = sendText![indexPath.row]

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
        
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                sendText!.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                print(appDelegate.Text)
                appDelegate.Text = sendText!.joined(separator: ",,,")

        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
