//
//  ViewController.swift
//  iOS对象间通讯
//
//  Created by TTian on 2022/4/19.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableV:UITableView = {
        let tableV = UITableView(frame: CGRect(x: 0, y: 84, width: TScreenW, height: 300), style: .plain)
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return tableV
    }()
    lazy var label:UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 400, width: TScreenW, height: 50))
        label.textColor = UIColor.red
        label.textAlignment = .center
        return label
    }()
    let data = ["代理","通知","Block","KVO","KVC"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        self.tableV.delegate = self
        self.tableV.dataSource = self
        self.view.addSubview(self.tableV)
        self.tableV.reloadData()
        
        // 显示传回来的值
        self.view.addSubview(self.label)
        // 接收通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNoti), name: NSNotification.Name.init(rawValue: "noti"), object: nil)
        // 测试
    }
}
// tableView
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = self.data[indexPath.row]
        print("点击\(index)")
        switch index {
        case "代理":
            let delegateVC = DelegateViewController()
            // 设置代理控制器的代理
            delegateVC.delegate = self
            self.present(delegateVC, animated: true)
        case "通知":
            let notiVC = NotiViewController()
            self.present(notiVC, animated: true)
        case "Block":
            let blockVC = BlockViewController()
            weak var weakSelf = self
            blockVC.block = {(_ name: String) in
                weakSelf?.label.text = name
            }
            self.present(blockVC, animated: true)
        case "KVO":
            let KVOVC = KVOViewController()
            self.present(KVOVC, animated: true)
        case "KVC":
            let KVCVC = KVCViewController()
            self.present(KVCVC, animated: true)
        default:
            print("不知道点了啥")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
// 代理传值
extension ViewController:DelegateViewControllerDelegate{
    func delegateTest(param: String) {
        print(param)
        self.label.text = param
    }
}
// 通知传值
extension ViewController{
    @objc func receiveNoti(noti: Notification){
        let value = noti.userInfo?["noti"]
        self.label.text = value as? String
    }
}

