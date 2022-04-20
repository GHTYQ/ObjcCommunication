//
//  BlockViewController.swift
//  iOS对象间通讯
//
//  Created by TTian on 2022/4/19.
//

import UIKit

typealias CustomBlock = (_ name: String) ->Void

class BlockViewController: UIViewController {
    var  block:CustomBlock?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.block?("Block传值")
        self.dismiss(animated: true)
    }

}
