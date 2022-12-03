//
//  PhoneCodesViewController.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 23.10.2022.
//

import UIKit


final class PhoneCodesViewController: UIViewController {
    
    private var phoneCodes = PhoneCodesInfo.getCountriesList()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super .viewDidLoad()
        configureTableView()
        setupNavigationBar()
    }
    
    
    //MARK: configureTableView
    
    private func configureTableView() {
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pin(to: view)
        tableView.register(PhoneCodesCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(red: 75/255, green: 0/255, blue: 130/255, alpha: 1)
    }

    
    func setupNavigationBar() {
        title = "Countries Codes"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barStyle = .black
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true

        }
    }
    
    
    
    //MARK: numberOfSection

   func numberOfSections(in tableView: UITableView) -> Int {
        phoneCodes.count
    }
    
    
    //MARK: titleForHeaderInSection
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       phoneCodes[section].sectionName + " " + "Countries"
    }
    
    
    //MARK: viewForHeaderInSection
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        header.textLabel?.textColor = .white
    }
    
    
    //MARK: didSelectRowAt
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            phoneCodes[indexPath.section].isOpened = !phoneCodes[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            print("tapped cell at\(indexPath.row)")
        }
    }
}


//MARK: Extension

extension PhoneCodesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = phoneCodes[section]
        
        if section.isOpened {
            return section.sectionObject.count + 1
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhoneCodesCell
        
        cell.backgroundColor = .orange
        cell.layer.cornerRadius = 10
        cell.layer.opacity = 0.8
        
        
        let isCellSelected = phoneCodes[indexPath.section].isOpened
        
        if indexPath.row == 0 {
            
            cell.sectionLabelText.text = !isCellSelected ? "Show \(phoneCodes[indexPath.section].sectionName) countries" : "Hide \(phoneCodes[indexPath.section].sectionName) countries"
            
            cell.mainTitleText.text = nil
            cell.secondaryText.text = nil
        } else {
            cell.sectionLabelText.text = nil
            let keys = Array(phoneCodes[indexPath.section].sectionObject.keys)
            let values = Array(phoneCodes[indexPath.section].sectionObject.values)
            
            cell.mainTitleText.text = keys[indexPath.row - 1]
            cell.secondaryText.text = values[indexPath.row - 1]
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }
}
