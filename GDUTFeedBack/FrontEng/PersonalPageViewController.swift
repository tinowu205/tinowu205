//
//  PersonalPageViewController.swift
//  GDUTFeedBack
//
//  Created by Tino Wu on 2022/5/15.
//

import UIKit

class PersonalPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "head")
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "body")
        self.view.addSubview(self.tableView!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 150
        } else {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "head")
            cell?.imageView?.image = UIImage(named: "1")
            cell?.textLabel?.text = "Tino Wu"
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "body")
            cell?.textLabel?.text = "所有反馈"
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
