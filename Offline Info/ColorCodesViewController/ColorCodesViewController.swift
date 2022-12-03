//
//  ColorCodesViewController.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 18.11.2022.
//

import Foundation
import UIKit

class ColorCodesViewController: UIViewController {
    
    private var selectedColor = UIColor.gray
    private var colorPicker = UIColorPickerViewController()
    
    
   let colorButton: UIButton = {
       let colorButton = UIButton(type: .system)
        
        colorButton.setTitle("Choose color", for: .normal)
        colorButton.tintColor = UIColor.black
        colorButton.backgroundColor = UIColor.white
        colorButton.layer.cornerRadius = 15
        colorButton.addTarget(self, action: #selector(showColorPickerVC), for: .touchUpInside)
       
        
        return colorButton
    }()
    
    let rgbValuesView: UIView = {
        let rgbValuesView = UIView()
        rgbValuesView.backgroundColor = UIColor.black
        rgbValuesView.layer.cornerRadius = 15
        
        return rgbValuesView
    }()
    
    let colorDescriptionView: UITextView = {
        let colorDescriptionView = UITextView()
        colorDescriptionView.backgroundColor = UIColor(red: 75/255, green: 0/255, blue: 130/255, alpha: 1)
        colorDescriptionView.layer.cornerRadius = 10
        
        colorDescriptionView.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        colorDescriptionView.textColor = UIColor.white
        
        
        return colorDescriptionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = selectedColor
        view.addSubview(colorButton)
        view.addSubview(rgbValuesView)
        rgbValuesView.addSubview(colorDescriptionView)
        
        setColorButtonConstraints()
        setRGBValueViewConstraints()
        setTextViewConstraints()
        
        updateRGBButtonText()
        
        self.colorPicker.delegate = self
        self.colorPicker.supportsAlpha = true
        self.colorPicker.selectedColor = selectedColor
    }
    
    private func setRGBValueViewConstraints() {
        rgbValuesView.translatesAutoresizingMaskIntoConstraints = false
        rgbValuesView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rgbValuesView.topAnchor.constraint(equalTo: colorButton.topAnchor, constant: 100).isActive = true
        rgbValuesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        rgbValuesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        rgbValuesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
    }
    
    private func setColorButtonConstraints() {
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        colorButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        colorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2).isActive = true
        colorButton.heightAnchor.constraint(equalToConstant: view.frame.size.height / 10).isActive = true
    }
    
    
    private func setTextViewConstraints() {
        colorDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        colorDescriptionView.leadingAnchor.constraint(equalTo: rgbValuesView.leadingAnchor, constant: 16).isActive = true
        colorDescriptionView.trailingAnchor.constraint(equalTo: rgbValuesView.trailingAnchor, constant: -16).isActive = true
        colorDescriptionView.topAnchor.constraint(equalTo: rgbValuesView.topAnchor, constant: 16).isActive = true
        colorDescriptionView.bottomAnchor.constraint(equalTo: rgbValuesView.bottomAnchor, constant: -16).isActive = true
    }
    
    @objc func showColorPickerVC() {
        present(self.colorPicker, animated: true, completion: nil)
    }
    
    
    private func updateRGBButtonText() {
        guard var titleDescription = selectedColor.cgColor.components else {return}
        
        let colorNames = ["Red", "Green", "Blue"]
        
        let alpha = (titleDescription.removeLast())
        let roundedAlpha = Double(round(1000 * alpha) / 1000)
       
       
        var rgbTextRepresentation = "Alpha: \(roundedAlpha) \n"
        
        for (name, color) in zip(colorNames, titleDescription) {
            
                let receivedColor: (String, CGFloat) = (name, CGFloat(color * 255))
            let stringValue = String(Double(round(1000 * receivedColor.1) / 1000))
                let fullDescription = receivedColor.0 + ": " + stringValue + "\n"
               
                rgbTextRepresentation += fullDescription
            }
        colorDescriptionView.text = rgbTextRepresentation
    }
    

    private func animateRGBView() {
        changeSubviewsColor()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = 0.5
            animation.repeatCount = 1
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            
            self.rgbValuesView.layer.add(animation, forKey: nil)
        }
    }
    
    
    private func changeSubviewsColor() {
        guard let currentValues = selectedColor.cgColor.components else {return}
        
        if (currentValues[2] * 255) > 255 / 2 {
            rgbValuesView.backgroundColor = UIColor.black
            colorButton.backgroundColor = UIColor(red: 75/255, green: 0/255, blue: 130/255, alpha: 1)
            colorButton.tintColor = UIColor.white
        } else {
            rgbValuesView.backgroundColor = UIColor.white
            colorButton.backgroundColor = UIColor.white
            colorButton.tintColor = UIColor.black

        }
    }
    
}


extension ColorCodesViewController: UIColorPickerViewControllerDelegate{
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.selectedColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.view.backgroundColor = self.selectedColor
        updateRGBButtonText()
        animateRGBView()
    
    }
}



//
////создание анимации
//animation = CABasicAnimation(keyPath: "strokeEnd") //keyPath - свойство которое хотим анимировать
//animation.toValue = 1 //значение до которого мы будем анимировать свойство от 0 до 1 / начальное значение 0 указывается при инициализации
//animation.duration = 2 // продолжительность анимации
//
//animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut) // обозначаем то как должна проходить анимация
//animation.fillMode = CAMediaTimingFillMode.both // предотвращает удаление анимации сразу после своего завершения (пример из проекта)
//animation.isRemovedOncompletion = false //удаление по завршению
//
//someObject.add(animation, forKey: animation.keyPath) // добавление анимации


