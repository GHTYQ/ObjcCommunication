//
//  KVCViewController.swift
//  iOS对象间通讯
//
//  Created by TTian on 2022/4/19.
//

import UIKit

class KVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let p = Person()
        p.setValue("taylor", forKey: "name")
        print(p.name ?? "")
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }

}
