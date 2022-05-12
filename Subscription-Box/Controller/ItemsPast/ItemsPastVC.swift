//
//  ItemsPastVC.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class ItemsPastVC: UIViewController {
    
    var theBox: Box!
    
    var itemName: [String] = []
    var itemImage: [String] = []
    
    //MARK: Setting up UITableView
    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 100
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setTable()
            getData()
    }
        
    func setTable(){
        self.view.addSubview(table)
        self.view.backgroundColor = .white
        
        table.register(ItemViewCell.self, forCellReuseIdentifier: ItemViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        NSLayoutConstraint.activate([
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
        
    func getData(){
        let items = theBox!.items
        
        for item in items{
            itemName.append(item.name)
            itemImage.append(item.image)
        }
    }
}

extension ItemsPastVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theBox.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemViewCell.identifier, for: indexPath) as! ItemViewCell
        cell.imageView?.image = UIImage(named: "example")
        cell.textLabel?.text = "\(itemName[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Past Item Selected")
    }
    
    
}
