//
//  PastBoxesVC.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/30/22.
//

import UIKit

class PastBoxesVC: UIViewController{
    
    var testBoxes = [Box]()
//
//
    //MARK: Setting up UITableView
    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 100
       return table
    }()
    
//MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        getData()

    }
    
    func setTable(){
        self.view.addSubview(table)
        self.view.backgroundColor = .white
        
        table.register(PastBoxesCell.self, forCellReuseIdentifier: PastBoxesCell.identifier)
        
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
        let bone = Item(name: "Dental Bone", image: "")
        
        let box = Box(date: "Apr 2022", items: [bone,bone,bone,bone])
        testBoxes.append(box)
        let box2 = Box(date: "Mar 2022", items: [bone,bone,bone])
        testBoxes.append(box2)
        let box3 = Box(date: "Feb 2022", items: [bone,bone])
        testBoxes.append(box3)
    }


}

//MARK: Extensions
extension PastBoxesVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return testBoxes.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PastBoxesCell.identifier, for: indexPath) as! PastBoxesCell
        cell.imageView?.image = UIImage(named: "box")
        cell.setContents(box:testBoxes[indexPath.row])
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ItemsPastVC()
        vc.theBox = testBoxes[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

