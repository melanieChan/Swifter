//
//  LoginViewController.swift
//  Twitter
//
//  Created by Melanie Chan on 2/19/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // check if user already logged in before
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }
    }
    
    // function called when button is clicked
    @IBAction func onLoginButton(_ sender: Any) {
        
        let apiUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: apiUrl, success: {
            // to remember that user already logged in for next time when user opens app
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            //if successful login, it will segue to home screen
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }, failure: { (Error) in
            print("login failed")
        })
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
