//
//  TextConverterViewController.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 05.11.2022.
//

import UIKit
import KMPlaceholderTextView

class TextConverterViewController: UIViewController {
    
    let inputTextView: KMPlaceholderTextView = {
        let inputTextView = KMPlaceholderTextView()
        inputTextView.backgroundColor = .white
        inputTextView.layer.cornerRadius = 10
        inputTextView.placeholder = "Text input..."
        inputTextView.font = UIFont(name: "Al Nile", size: 20)
        inputTextView.layer.opacity = 0.9
        
        
        
        return inputTextView
    }()
    
    let swapButton: UIButton = {
        let swapButton = UIButton()
        swapButton.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        swapButton.backgroundColor = .blue
        swapButton.layer.cornerRadius = 10
        swapButton.layer.masksToBounds = true
        swapButton.addTarget(self, action: #selector(swapTextFields), for: .touchUpInside)
        
        return swapButton
    }()
    
    let clearButton: UIButton = {
        let clearButton = UIButton()
        clearButton.setImage(UIImage(systemName: "clear"), for: .normal)
        clearButton.backgroundColor = .blue
        clearButton.layer.cornerRadius = 10
        clearButton.layer.masksToBounds = true
        
        return clearButton
    }()
    
    
    let convertButton: UIButton = {
        let convertButton = UIButton()
        convertButton.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        convertButton.backgroundColor = .blue
        convertButton.layer.cornerRadius = 10
        convertButton.layer.masksToBounds = true
        
        convertButton.addTarget(self, action: #selector(convertTextToBinary), for: .touchUpInside)
        
        return convertButton
    }()
    
    
    let codeField: KMPlaceholderTextView = {
        let codeField = KMPlaceholderTextView()
        codeField.backgroundColor = .white
        codeField.layer.cornerRadius = 10
        codeField.placeholder = "Binary output..."
        codeField.font = UIFont(name: "Al Nile", size: 20)
        codeField.layer.opacity = 0.9
        
        
        return codeField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        inputTextView.delegate = self
        view.backgroundColor = UIColor(patternImage: UIImage(named: "AppBackgr")!)
        configureView()
        setSubviewsConstraints()
    }
    
    
    //регистрируем два обзервера следящих за появлением и сокрытием клавиатуры
    //параметры / 1 наблюдатель/2 методы вызванный когда сработает наблюдатель/3 триггер активирующий обзервер - появление клавиатуры
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil
        )
    }
    
    //notification будут удалены при закрытии viewController
    deinit {
        removeKeyboardNotifications()
    }
    
    //удаляем наблюдателей
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //notification - показывает какие характеристики будут переданы с уведомлением
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyBoardFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        for button in [swapButton, clearButton, convertButton] {
            button.frame.origin.y -= keyBoardFrameSize.height / 15
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let userInfo = notification.userInfo
        let keyBoardFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        for button in [swapButton, clearButton, convertButton] {
            button.frame.origin.y += keyBoardFrameSize.height / 15
        }
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            
            self.view.endEditing(true) // скрытие клавиатуры для любого объекта
            // inputTextView.resignFirstResponder() - скрытие клавиатуры для конкретного объекта
        }
        
    
    
    func setTextFieldConstraints() {
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        inputTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        inputTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        inputTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        inputTextView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3).isActive = true
    }

    
    func setSwapButtonConstraints() {
        swapButton.translatesAutoresizingMaskIntoConstraints = false
        swapButton.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 20).isActive = true
        swapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        swapButton.trailingAnchor.constraint(equalTo: convertButton.leadingAnchor, constant: -20).isActive = true
        swapButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setConvertButtonConstraints() {
        convertButton.translatesAutoresizingMaskIntoConstraints = false
        convertButton.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 20).isActive = true
        convertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        convertButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        convertButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setClearButtonConstraints() {
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 20).isActive = true
        clearButton.leadingAnchor.constraint(equalTo: convertButton.trailingAnchor, constant: 20).isActive = true
        clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    
    
    func setCodeFieldConstraints() {
        codeField.translatesAutoresizingMaskIntoConstraints = false
        codeField.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 20).isActive = true
        codeField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        codeField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        codeField.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3).isActive = true
    }
   
    
    private func setSubviewsConstraints() {
        setTextFieldConstraints()
        setSwapButtonConstraints()
        setConvertButtonConstraints()
        setClearButtonConstraints()
        setCodeFieldConstraints()
    }
    
    private func configureView() {
        view.addSubview(inputTextView)
        view.addSubview(swapButton)
        view.addSubview(clearButton)
        view.addSubview(convertButton)
        view.addSubview(codeField)
    }
}


extension TextConverterViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        inputTextView.layer.opacity = 1.0
        codeField.layer.opacity = 1.0
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        inputTextView.layer.opacity = 0.9
        codeField.layer.opacity = 0.9
    }
    
    @objc func convertTextToBinary() -> String {
        
        let string = inputTextView.text
        
        if string?.range(of: "[a-zA-z0-9]", options: .regularExpression) != nil {
            let generatedText = string?.stringToBinary()
            codeField.text = generatedText
        } else {
            showInputSymbolsAlert()
            codeField.text = nil
            inputTextView.text = nil
        }
        return codeField.text
    }
    
    
    
    
     
    @objc func swapTextFields(swapValue: Bool) {
        var isTextField = swapValue
        inputTextView.placeholder = isTextField ? "Text input" : "Binary output"
        codeField.placeholder = isTextField ? "Binary input" : "Text output"
        isTextField.toggle()
        inputTextView.layoutSubviews()
    }
    
    private func showInputSymbolsAlert() {
        let alert = UIAlertController(title: "This text is not convertable", message: "Only a-z, A-Z, 0-9 and !#$%&'()''*+,-./_?@ symbols allowed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
}

extension String {
    func stringToBinary() -> String {
        let string = self
        var result = ""
        for char in string.utf8 {
            var tranformed = String(char, radix: 2)
            while tranformed.count < 8 {
                tranformed = "0" + tranformed
            }
            let binary = "\(tranformed) "
            result.append(binary)
        }
        return result
    }
}
