//
//  Login.swift
//  LoginPrototype
//
//  Created by Marvin Kleinpaß on 11.04.20.
//  Copyright © 2020 Marvin Kleinpaß. All rights reserved.
//

import UIKit

class LoginRegisterBase: UIViewController {
    
    fileprivate lazy var leftAchor = (self.view.frame.width - self.contentSize.width) / 2
    
    fileprivate lazy var contentSize: CGSize = { CGSize(width: self.view.frame.width * 0.72, height: 60) }()
    
    fileprivate lazy var textField: (CGPoint)->(UITextField) = {
        let tf = UITextField(frame: .zero)
        tf.frame.size = self.contentSize
        tf.frame.origin = $0
        tf.backgroundColor = .white
        tf.borderStyle = .none
        tf.textColor = .black
        tf.textAlignment = .center
        return tf
    }
    
    fileprivate lazy var label: (CGPoint, String)->(UILabel) = {
        let l = UILabel(frame: CGRect(origin: $0, size: self.contentSize))
        l.text = $1
        l.font = .boldSystemFont(ofSize: 20)
        l.backgroundColor = .clear
        l.textColor = .white
        l.textAlignment = .center
        return l
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.view.backgroundColor = #colorLiteral(red: 0.003314957255, green: 0.2099342942, blue: 0.7996845841, alpha: 1)
    }
    
    @objc func close(){
        self.dismiss(animated: true) { print("Dismissed") }
    }
}
class Register: LoginRegisterBase {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _configure()
    }
    
    fileprivate lazy var submit: UIButton = {
        let l = UIButton(frame: .zero)
        l.center = self.view.center
        l.frame.size = self.contentSize
        l.setTitle("Submit", for: .normal)
        l.addTarget(self, action: #selector(performSubmit), for: .touchUpInside)
        l.backgroundColor = .white
        l.setTitleColor(.black, for: .normal)
        l.titleLabel?.font = .systemFont(ofSize: 20)
        return l
    }()
    
    @objc func performSubmit(){
        print("\(Date().timeIntervalSince1970): Submit pressed....")
    }
}

class Reset: LoginRegisterBase {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _configure()
    }
    
    fileprivate lazy var submit: UIButton = {
        let l = UIButton(frame: .zero)
        l.center = self.view.center
        l.frame.size = self.contentSize
        l.setTitle("Submit", for: .normal)
        l.addTarget(self, action: #selector(performSubmit), for: .touchUpInside)
        l.backgroundColor = .white
        l.setTitleColor(.black, for: .normal)
        l.titleLabel?.font = .systemFont(ofSize: 20)
        return l
    }()
    
    @objc func performSubmit(){
        print("\(Date().timeIntervalSince1970): Submit pressed....")
    }
}

class Login: LoginRegisterBase {

    override func viewDidLoad() {
        super.viewDidLoad()
        _configure()
    }
    
    fileprivate lazy var login: UIButton = {
        let l = UIButton(frame: .zero)
        l.center = self.view.center
        l.frame.size = self.contentSize
        l.setTitle("Login", for: .normal)
        l.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
        l.backgroundColor = .white
        l.setTitleColor(.black, for: .normal)
        l.titleLabel?.font = .systemFont(ofSize: 20)
        return l
    }()
    
    fileprivate lazy var reset: UIButton = {
        let l = UIButton(frame: .zero)
        l.center = self.view.center
        l.frame.size = self.contentSize
        l.setTitle("Reset Your Credentials", for: .normal)
        l.addTarget(self, action: #selector(performReset), for: .touchUpInside)
        l.backgroundColor = #colorLiteral(red: 0.003314957255, green: 0.2099342942, blue: 0.7996845841, alpha: 1)
        l.setTitleColor(#colorLiteral(red: 0.6756498814, green: 0.8206848502, blue: 1, alpha: 1), for: .normal)
        l.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return l
    }()
    
    @objc func performLogin(){
        print("\(Date().timeIntervalSince1970): Login pressed....")
    }
    @objc func performReset(){
        print("\(Date().timeIntervalSince1970): Reset pressed....")
        let c = Reset().embeed
        c.modalPresentationStyle = .fullScreen
        self.present(c, animated: true) {
            print("Presented Reset VC")
        }
        
    }
}

extension Reset {
    fileprivate func _configure(){
        /// Compose the stuff
        // Title
        self.view.backgroundColor = #colorLiteral(red: 0.01574173197, green: 0.4439552426, blue: 0.9501439929, alpha: 1)
        let title = label(CGPoint(x: leftAchor, y: 68),"Reset")
        title.font = .boldSystemFont(ofSize: 50)
        //title.frame.size.height = 80
        self.view.addSubview(title)
        //Enter Your Email
        let maiLlb = label(CGPoint(x: leftAchor, y: title.frame.maxY + 1.5 * contentSize.height),"Enter Your Email")
        let enterEmail = textField(CGPoint(x: leftAchor, y:maiLlb.frame.maxY))
        self.view.addSubview(maiLlb)
        self.view.addSubview(enterEmail)
        submit.frame.origin.y = enterEmail.frame.maxY + (contentSize.height*1.5)
        submit.frame.origin.x = leftAchor
        self.view.addSubview(submit)
    }
}

extension Register {
    fileprivate func _configure(){
        // Title
        self.view.backgroundColor = #colorLiteral(red: 0.01574173197, green: 0.4439552426, blue: 0.9501439929, alpha: 1)
        let title = label(CGPoint(x: leftAchor, y: 68),"Register")
        title.font = .boldSystemFont(ofSize: 50)
        //title.frame.size.height = 80
        self.view.addSubview(title)
        //Enter Your Email
        let maiLlb = label(CGPoint(x: leftAchor, y: title.frame.maxY + 1.5 * contentSize.height),"Enter Your Email")
        let enterEmail = textField(CGPoint(x: leftAchor, y:maiLlb.frame.maxY))
        self.view.addSubview(maiLlb)
        self.view.addSubview(enterEmail)
        // Enter Your Password
        let passlb = label(CGPoint(x: leftAchor, y: maiLlb.frame.maxY + (contentSize.height * 1.5)),"Enter Your Password")
        let enterPassword = textField(CGPoint(x: leftAchor, y:passlb.frame.maxY))
        let passlb2 = label(CGPoint(x: leftAchor, y: enterPassword.frame.maxY + 10),"Confirm Your Password")
        let confirmPassword = textField(CGPoint(x: leftAchor, y:passlb2.frame.maxY))
        //
        self.view.addSubview(passlb)
        self.view.addSubview(passlb2)
        self.view.addSubview(enterPassword)
        self.view.addSubview(confirmPassword)
        // Login
        submit.frame.origin.y = confirmPassword.frame.maxY + (contentSize.height*1.5)
        submit.frame.origin.x = leftAchor
        self.view.addSubview(submit)
    }
}

extension Login {
    fileprivate func _configure(){
        // Title
        self.view.backgroundColor = #colorLiteral(red: 0.003314957255, green: 0.2099342942, blue: 0.7996845841, alpha: 1)
        let title = label(CGPoint(x: leftAchor, y: 68),"Login")
        title.font = .boldSystemFont(ofSize: 50)
        self.view.addSubview(title)
        //Enter Your Email
        let maiLlb = label(CGPoint(x: leftAchor, y: title.frame.maxY + 1.5 * contentSize.height),"Enter Your Email")
        let enterEmail = textField(CGPoint(x: leftAchor, y:maiLlb.frame.maxY))
        self.view.addSubview(maiLlb)
        self.view.addSubview(enterEmail)
        // Enter Your Password
        let passlb = label(CGPoint(x: leftAchor, y: maiLlb.frame.maxY + (contentSize.height * 1.5)),"Enter Your Password")
        let enterPassword = textField(CGPoint(x: leftAchor, y:passlb.frame.maxY))
        self.view.addSubview(passlb)
        self.view.addSubview(enterPassword)
        // Login
        login.frame.origin.y = enterPassword.frame.maxY + (contentSize.height*1.5)
        login.frame.origin.x = leftAchor
        reset.frame.origin.y = login.frame.maxY
        reset.frame.origin.x = leftAchor
        self.view.addSubview(login)
        self.view.addSubview(reset)
    }
}
extension UIViewController {
    var embeed: UINavigationController {
        UINavigationController(rootViewController: self)
    }
}
