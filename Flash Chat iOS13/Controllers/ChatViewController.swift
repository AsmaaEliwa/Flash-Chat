//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
//import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
class ChatViewController: UIViewController {
    let db = Firestore.firestore()
    var messages:[Message] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad()   {
        super.viewDidLoad()
        Task { @MainActor in
            await getMessages()
            
        }
        title = Constants.appName
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil),forCellReuseIdentifier: Constants.cellIdentifier)
        navigationItem.hidesBackButton = true
       
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        Task { @MainActor in
            if let messageBody = messageTextfield.text
                ,let messageSender = Auth.auth().currentUser?.email{
            
             
                do {
                    let mes = try await db.collection(Constants.FStore.collectionName).addDocument(data: [
                        Constants.FStore.senderField : messageSender  ,
                        Constants.FStore.bodyField : messageBody
                    ])
                    print("message added with ID: \(mes.documentID)")
                } catch {
                    print("Error adding document: \(error)")
                }
            }
        }
    }
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}
extension ChatViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCellTableViewCell
        cell.messageLabel.text = messages[indexPath.row].body
        return cell
    }
    func getMessages() async{
        do {
            let mesagess = try await db.collection(Constants.FStore.collectionName).getDocuments()
          for mess in mesagess.documents {
              let newMessage = Message(sender: mess.data()["sender"]! as! String, body: mess.data()["body"] as! String)
              
              messages.append(newMessage)
              tableView.reloadData()
              
          }
        } catch {
          print("Error getting documents: \(error)")
        }
    }
    
}
