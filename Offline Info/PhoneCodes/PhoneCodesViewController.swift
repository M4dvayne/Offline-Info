//
//  PhoneCodesViewController.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 23.10.2022.
//

import UIKit


class PhoneCodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var phoneCodes = PhoneCodesInfo.getCountriesList()
    private let tableView = UITableView()
    
    struct Cells {
        static let newsCell = "NewsCell"
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        view.addSubview(tableView)
        tableView.register(PhoneCodesCell.self, forCellReuseIdentifier: Cells.newsCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
   

    func numberOfSections(in tableView: UITableView) -> Int {
        phoneCodes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = phoneCodes[section]
        
        if section.isOpened {
            return section.sectionObject.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.newsCell, for: indexPath) as! PhoneCodesCell
//        var content = cell.defaultContentConfiguration()
        
        if indexPath.row == 0 {
            
            cell.mainLabel.text = "\(phoneCodes[indexPath.section].sectionName)"
//            content.textProperties.alignment = .center
//            content.image = UIImage(systemName: "chevron.right")
//            cell.accessoryType = .disclosureIndicator
//            
//            cell.contentConfiguration = content
            return cell
            
        } else {
            let keys = Array(phoneCodes[indexPath.section].sectionObject.keys)
            let values = Array(phoneCodes[indexPath.section].sectionObject.values)
            
            cell.secondaryLabel.text = "\(keys[indexPath.row - 1])"
            cell.secondaryLabel.text = "\(values[indexPath.row - 1])"
//            cell.contentConfiguration = content
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            phoneCodes[indexPath.section].isOpened = !phoneCodes[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            print("tapped cell at\(indexPath.row)")
        }
       
    }
    
    
    //MARK: Navigation To Phone Codes Controller
    
    
}
