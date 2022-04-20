//
//  KVOViewController.swift
//  iOS对象间通讯
//
//  Created by TTian on 2022/4/19.
//

import UIKit

class Person: NSObject {
    // @objc 需要暴露给OC使用的
    // dynamic 告诉编译器使用动态分发，这样就可以使用OC运行时特性
    @objc dynamic var name:String?
    var observation: NSKeyValueObservation?
}

class KVOViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let p = Person()
        // 旧的KVO沿用OC的使用方法
        p.addObserver(self, forKeyPath: "name", options: [.new,.old], context: nil)
        p.name = "swift"
        // swift新的API
//        p.observation = p.observe(\Person.name, options: .new, changeHandler: { person, change in
//            print(change.newValue as Any)
//        })
      
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "name" {
            guard let newValue = change?[NSKeyValueChangeKey(rawValue: "new")] else { return }
            print(newValue)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }

}
