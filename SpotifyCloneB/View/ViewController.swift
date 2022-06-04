//
//  ViewController.swift
//  SpotifyCloneB
//
//  Created by MAC42 on 14/05/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTappedLogin(_ sender: Any) {
        let email = textFieldEmail.text!
        let password = textFieldPassword.text!
        login(email: email, password: password)
    }
    func login(email:String,password:String){
        Auth.auth().signIn(withEmail: email, password: password){
            authResult, error in
            // en caso el usuario no existe debemos crearlo
            //si el error es distinto a nil vamos asumir que el user no existe
            if error != nil {
                self.register(email: email, password: password)
            }else{
                // ir a la otra vista
            }
        }
    }
    func register(email:String,password:String){
        Auth.auth().createUser(withEmail: email, password: password){
            authResult,error in
            // si el error es igual a nil todo esta ok
            if error == nil {
                //debemos que ir a otra vista
            }
        }
    }
}

