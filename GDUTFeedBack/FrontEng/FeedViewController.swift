//
//  FeedViewController.swift
//  GDUTFeedBack
//
//  Created by Tino Wu on 2022/5/15.
//

import UIKit

class feedBackModel : NSObject {
    var fromName : String
    var content : String
    
    init(from: String, content: String) {
        self.fromName = from
        self.content = content
    }
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var modelArray : [feedBackModel]?
    var tableView : UITableView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        modelArray = self.getModelData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let modelArray = modelArray else {
            return UITableViewCell()
        }
        let model = modelArray[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle(rawValue: 1)!, reuseIdentifier: "reuse")
        cell.textLabel?.text = model.fromName
        cell.detailTextLabel?.text = model.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func getModelData() -> [feedBackModel] {
        let model1 = feedBackModel(from: "张三", content: "三饭不干净")
        let model2 = feedBackModel(from: "采吉", content: "四饭人好多")
        return [model1,model2]
    }
}
