//
//  ViewController.swift
//  Sample5
//
//  Created by anand chinte on 4/12/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialButtons
import FirebaseAuth


class ViewController: UIViewController {
    
    var button = MDCButton()
    var email_tf = MDCOutlinedTextField()
    var password_tf = MDCOutlinedTextField()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .yellow
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Image
        let loginText = UITextView(frame: CGRect(x: (view.frame.size.width-320)/2,
                                                 y: 150,
                                                 width: 320,
                                                 height: 50))
        loginText.text = "Login"
        loginText.font = .systemFont(ofSize: 25)
        view.addSubview(loginText)
        
        
        //Material Text field
        email_tf = MDCOutlinedTextField(frame: CGRect(x: (view.frame.size.width-320)/2,
                                                         y: 200,
                                                         width: 320,
                                                         height: 50))
        email_tf.label.text = "Email Id"
        email_tf.placeholder = "abc@gmail.com"
        //textField.leadingAssistiveLabel.text = "This is helper text"
        email_tf.sizeToFit()
        email_tf.minimumFontSize = 25
        email_tf.autocapitalizationType = .none
        email_tf.autocorrectionType = .no
        //textField.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        email_tf.layer.shadowColor = UIColor.black.cgColor
        email_tf.layer.shadowOffset = CGSize(width: 3, height: 3)
        email_tf.layer.shadowRadius = 5
        email_tf.layer.shadowOpacity = 0.5
        email_tf.setOutlineColor(.blue, for: .normal)
        email_tf.setOutlineColor(.blue, for: .editing)
        email_tf.backgroundColor = .white
        view.addSubview(email_tf)


        //LastName
        password_tf = MDCOutlinedTextField(frame: CGRect(x: (view.frame.size.width-320)/2,
                                                         y: 300,
                                                         width: 320,
                                                          height: 50))
        password_tf.label.text = "Password"
        //password_tf.placeholder = "last name"
        password_tf.isSecureTextEntry = true
        //textField.leadingAssistiveLabel.text = "This is helper text"
        password_tf.sizeToFit()
        password_tf.minimumFontSize = 25
        //textField.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        password_tf.layer.shadowColor = UIColor.black.cgColor
        password_tf.layer.shadowOffset = CGSize(width: 3, height: 3)
        password_tf.layer.shadowRadius = 5
        password_tf.layer.shadowOpacity = 0.5
        password_tf.setOutlineColor(.blue, for: .normal)
        password_tf.setOutlineColor(.blue, for: .editing)
        password_tf.backgroundColor = .white
        view.addSubview(password_tf)
//        password_tf.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        password_tf.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        password_tf.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        password_tf.heightAnchor.constraint(equalToConstant: 50).isActive = true

        //Button
        button = MDCButton(frame: CGRect(x: (view.frame.size.width-220)/2,
                                             y: 400,
                                             width: 220,
                                             height: 50))
        button.backgroundColor = .blue
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.inkColor = UIColor(red: 72/225, green: 219/225, blue: 251/225, alpha: 1.0)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    
        
    }
    
    @objc func buttonAction(sender: UIButton!){

        let email = email_tf.text
        let password = password_tf.text

        if (email!.trimmingCharacters(in: .whitespaces).isEmpty) {
            print("Please Enter first name")
        }else if (password!.trimmingCharacters(in: .whitespaces).isEmpty){
            print("Please Enter last name")
        }else {
            Auth.auth().signIn(withEmail: email!, password: password!) { authResult, error in
                if let e = error {
                    print(e)

                }else {

                    self.performSegue(withIdentifier: "LoginToRegister", sender: self)

                }
            }


        }


    }
    

}

