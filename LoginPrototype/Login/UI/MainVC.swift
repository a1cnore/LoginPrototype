//
//  MainVC.swift
//  LoginPrototype
//
//  Created by Marvin Kleinpaß on 11.04.20.
//  Copyright © 2020 Marvin Kleinpaß. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - UI Stuff
    lazy var btnHeight: CGFloat = { view.frame.height * 0.1 }()
    lazy var login: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: view.frame.height - (btnHeight * 2), width: view.frame.width, height: btnHeight))
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 30)
        btn.backgroundColor = #colorLiteral(red: 0.003314957255, green: 0.2099342942, blue: 0.7996845841, alpha: 1)
        btn.addTarget(self, action: #selector(showRegister), for: .touchUpInside)
        return btn
    }()
    
    lazy var register: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: login.frame.maxY, width: view.frame.width, height: btnHeight))
        btn.setTitle("Register", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 30)
        btn.backgroundColor = #colorLiteral(red: 0.01574173197, green: 0.4439552426, blue: 0.9501439929, alpha: 1)
        btn.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
        return btn
    }()
    
    func initializeView(){
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - (2*btnHeight)))
        bg.image = #imageLiteral(resourceName: "map")
        self.view.addSubview(login)
        self.view.addSubview(register)
        bg.contentMode = .scaleAspectFill
        self.view.insertSubview(bg, at: 0)
        
    }
    
    
    
    @objc func showLogin(){
        let c = Login().embeed
        c.modalPresentationStyle = .fullScreen
        self.present(c, animated: true, completion: nil)
    }
    @objc func showRegister(){
        let c = Register().embeed
        c.modalPresentationStyle = .fullScreen
        self.present(c, animated: true, completion: nil)
    }
}





