//
//  ViewController.swift
//  LoginPrototype
//
//  Created by Marvin Kleinpaß on 11.04.20.
//  Copyright © 2020 Marvin Kleinpaß. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _configure()
        
        let btn = UIButton(frame: CGRect(x: 10, y: 100, width: 200, height: 44))
        
        btn.setTitle("Open Login Prototype", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(openLoginPrototype), for: .touchUpInside)
        
        
        self.view.addSubview(btn)
    }
    //
    @objc func openLoginPrototype(){
        
        let c = MainVC()
        c.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: c)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true) {
            print("\(Date().timeIntervalSince1970): Opened Login Prototype")
            
            
        }
        
    }
}


extension ViewController {
    fileprivate func _configure(){
        self.view.backgroundColor = .black
    }
}

