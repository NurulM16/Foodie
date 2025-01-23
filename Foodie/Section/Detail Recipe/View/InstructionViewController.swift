//
//  InstructionViewController.swift
//  Foodie
//
//  Created by Nurul Mustika on 12/12/24.
//

import UIKit

class InstructionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewInstructions: UITableView!
    
    var dataList: [Step] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewInstructions.delegate = self
        tableViewInstructions.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("instruction \(self.dataList.count)")
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: InstructionTableViewCell.self, at: indexPath)
        
        cell.configureCell(model: self.dataList[indexPath.row])
        return cell
    }
    
}
