//
//  DelegateViewController.swift
//  iOS对象间通讯
//
//  Created by TTian on 2022/4/19.
//

import UIKit
// 定义协议
@objc protocol DelegateViewControllerDelegate:NSObjectProtocol {
    // 定义协议方法
    // 这里如果想设置可选的协议方法 则前面必须加上 @objc
    @objc optional func delegateTest(param:String)
}

class DelegateViewController: UIViewController {
    // 声明代理
    weak var delegate: DelegateViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 执行代理
        self.delegate?.delegateTest?(param: "代理传值")
        self.dismiss(animated: true)
    }
}
