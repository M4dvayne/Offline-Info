//
//  MainViewController.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 20.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let outletHeightValue: CGFloat = 10
    
    //MARK: Phone Codes Button
    
   private lazy var phoneCodesButton: UIButton = {
       let phoneCodesButton = UIButton()
        phoneCodesButton.backgroundColor = .darkGray
        phoneCodesButton.setTitle("Phone Codes", for: .normal)
        phoneCodesButton.titleLabel?.font = UIFont(name: "Optima", size: 26)
        phoneCodesButton.titleLabel?.adjustsFontSizeToFitWidth = true
        phoneCodesButton.layer.opacity = 0.9
        phoneCodesButton.layer.cornerRadius = 15
       
       phoneCodesButton.addTarget(self, action: #selector(showPhoneCodes), for: .touchUpInside)
        
        return phoneCodesButton
    }()
    
    //MARK: Color Codes Button
    
    private let colorCodesButton: UIButton = {
        let colorCodesButton = UIButton(type: .custom)
        colorCodesButton.backgroundColor = .darkGray
        colorCodesButton.setTitle("Color Codes", for: .normal)
        colorCodesButton.titleLabel?.font = UIFont(name: "Optima", size: 26)
        colorCodesButton.titleLabel?.numberOfLines = 0
        colorCodesButton.titleLabel?.textAlignment = .center
        colorCodesButton.layer.opacity = 0.9
        colorCodesButton.layer.cornerRadius = 15
        
        return colorCodesButton
     }()
    
    //MARK: Emergency Numbers Button
    
    private let emergencyNumbersButton: UIButton = {
        let emergencyNumbersButton = UIButton()
        emergencyNumbersButton.backgroundColor = .darkGray
        emergencyNumbersButton.setTitle("Helplines", for: .normal)
        emergencyNumbersButton.titleLabel?.font = UIFont(name: "Optima", size: 26)
        emergencyNumbersButton.titleLabel?.numberOfLines = 0
        emergencyNumbersButton.titleLabel?.textAlignment = .center
        emergencyNumbersButton.layer.opacity = 0.9
        emergencyNumbersButton.layer.cornerRadius = 15
        
        
        return emergencyNumbersButton
    }()
    
    //MARK: Country Flags Button
    
    private let countryFlagsButton: UIButton = {
        let countryFlagsButton = UIButton()
        countryFlagsButton.backgroundColor = .darkGray
        countryFlagsButton.setTitle("Country Flags", for: .normal)
        countryFlagsButton.titleLabel?.font = UIFont(name: "Optima", size: 26)
        countryFlagsButton.titleLabel?.numberOfLines = 0
        countryFlagsButton.titleLabel?.textAlignment = .center
        countryFlagsButton.layer.opacity = 0.9
        countryFlagsButton.layer.cornerRadius = 15
        
        return countryFlagsButton
    }()

    //MARK: Abbreviations Button

    private let abbreviationsButton: UIButton = {
        let abbreviationsButton = UIButton()
        abbreviationsButton.backgroundColor = .darkGray
        abbreviationsButton.setTitle("Abbreviations", for: .normal)
        abbreviationsButton.titleLabel?.font = UIFont(name: "Optima", size: 26)
        abbreviationsButton.titleLabel?.numberOfLines = 0
        abbreviationsButton.titleLabel?.textAlignment = .center
        abbreviationsButton.layer.opacity = 0.9
        abbreviationsButton.layer.cornerRadius = 15

        return abbreviationsButton
    }()
    
    //MARK: Text To Code Converter Button
    
    private let textToCodeButton: UIButton = {
        let textToCodeButton = UIButton()
        textToCodeButton.backgroundColor = .darkGray
        textToCodeButton.setTitle("Text to Code Converter", for: .normal)
        textToCodeButton.titleLabel?.font = UIFont(name: "Optima", size: 26)
        textToCodeButton.titleLabel?.numberOfLines = 0
        textToCodeButton.titleLabel?.textAlignment = .center
        textToCodeButton.layer.opacity = 0.9
        textToCodeButton.layer.cornerRadius = 15
        
        return textToCodeButton
    }()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor(patternImage: UIImage(named: "mainB")!)
        addSubviews()
        setConstraints()
    }

//MARK: Constraints Methods
    private func setPhoneCodesButtonConstraints() {
        phoneCodesButton.translatesAutoresizingMaskIntoConstraints = false
        phoneCodesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        phoneCodesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        phoneCodesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        phoneCodesButton.heightAnchor.constraint(equalToConstant: view.frame.height / outletHeightValue).isActive = true
    }
    
    private func setColorCodesButtonConstraints() {
        colorCodesButton.translatesAutoresizingMaskIntoConstraints = false
        colorCodesButton.topAnchor.constraint(equalTo: phoneCodesButton.bottomAnchor, constant: 20).isActive = true
        colorCodesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        colorCodesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        colorCodesButton.heightAnchor.constraint(equalToConstant: view.frame.height / outletHeightValue).isActive = true
    }

    private func setEmergencyNumbersButtonConstraints() {
        emergencyNumbersButton.translatesAutoresizingMaskIntoConstraints = false
        emergencyNumbersButton.topAnchor.constraint(equalTo: colorCodesButton.bottomAnchor, constant: 20).isActive = true
        emergencyNumbersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        emergencyNumbersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        emergencyNumbersButton.heightAnchor.constraint(equalToConstant: view.frame.height / outletHeightValue).isActive = true
    }

    private func setCountryFlagsButtonConstraints() {
        countryFlagsButton.translatesAutoresizingMaskIntoConstraints = false
        countryFlagsButton.topAnchor.constraint(equalTo: emergencyNumbersButton.bottomAnchor, constant: 20).isActive = true
        countryFlagsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        countryFlagsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        countryFlagsButton.heightAnchor.constraint(equalToConstant: view.frame.height / outletHeightValue).isActive = true
    }

    private func setAbbreviationsButtonConstraints() {
        abbreviationsButton.translatesAutoresizingMaskIntoConstraints = false
        abbreviationsButton.topAnchor.constraint(equalTo: countryFlagsButton.bottomAnchor, constant: 20).isActive = true
        abbreviationsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        abbreviationsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        abbreviationsButton.heightAnchor.constraint(equalToConstant: view.frame.height / outletHeightValue).isActive = true
    }

    private func setTextToCodeButtonConstraints() {
        textToCodeButton.translatesAutoresizingMaskIntoConstraints = false
        textToCodeButton.topAnchor.constraint(equalTo: abbreviationsButton.bottomAnchor, constant: 20).isActive = true
        textToCodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textToCodeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textToCodeButton.heightAnchor.constraint(equalToConstant: view.frame.height / outletHeightValue).isActive = true
    }

    private func setConstraints() {
        setPhoneCodesButtonConstraints()
        setColorCodesButtonConstraints()
        setEmergencyNumbersButtonConstraints()
        setCountryFlagsButtonConstraints()
        setAbbreviationsButtonConstraints()
        setTextToCodeButtonConstraints()
    }
    
//MARK: Subviews Methods
    func addSubviews() {
        view.addSubview(phoneCodesButton)
        view.addSubview(colorCodesButton)
        view.addSubview(emergencyNumbersButton)
        view.addSubview(countryFlagsButton)
        view.addSubview(abbreviationsButton)
        view.addSubview(textToCodeButton)
    }
    
    
    //MARK: Show Phone Codes ViewController
    
    @objc private func showPhoneCodes() {
        let phoneViewController = PhoneCodesViewController()
        self.navigationController?.pushViewController(phoneViewController, animated: true)
    }
    
}

