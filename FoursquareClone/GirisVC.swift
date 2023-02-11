//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Özgür Salih Dülger on 2.02.2023.
//

import UIKit
import Parse

class GirisVC: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
        
    }
    
    
    @IBAction func girisYapTikla(_ sender: Any) {
        if userNameText.text != "" && passwordText.text != "" {
            
            PFUser.logInWithUsername(inBackground: userNameText.text!, password: passwordText.text!) { user, error in
                if error != nil {
                    self.makeAlert(titleInput: "HATA!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(titleInput: "HATA!", messageInput: "Kullanıcı adını veya şifrenizi giriniz")
        }
        
        
        
        
    }
    

    @IBAction func kayitOlTikla(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != "" {
            let user = PFUser()
            user.username = userNameText.text!
            user.password = passwordText.text!
            
            user .signUpInBackground { success, error in
                if error != nil {
                    self.makeAlert(titleInput: "HATA!", messageInput: error?.localizedDescription ?? "HATA!")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                
                }
            }
            
        } else {
            makeAlert(titleInput: "HATA!", messageInput: "Kullanıcı adını veya şifrenizi giriniz")
        }
        
    }
    
    
    func makeAlert(titleInput:String , messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

