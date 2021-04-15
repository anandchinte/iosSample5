//
//  HomePageViewController.swift
//  Sample5
//
//  Created by anand chinte on 4/13/21.
//

import UIKit
import FirebaseAuth

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogOutPressed(_ sender: UIBarButtonItem) {
        
        do {
          try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
