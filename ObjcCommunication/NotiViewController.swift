//
//  NotiViewController.swift
//  iOS对象间通讯
//
//  Created by TTian on 2022/4/19.
//

import UIKit

class NotiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
       
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "noti"), object: nil, userInfo: ["noti":"通知传值"])
        self.dismiss(animated: true)
    }

}
