//
//  PhoneCodesCell.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 28.10.2022.
//

import UIKit

final class PhoneCodesCell: UITableViewCell {
    
    var sectionLabelText = UILabel()
    var mainTitleText = UILabel()
    var secondaryText = UILabel()
    var cellArrowImage = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure Labels
    
    func configureSectionTitleLabel() {
        sectionLabelText.font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        
    }
    
    func configureMainTitleLabel() {
        mainTitleText.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        mainTitleText.textColor = UIColor.white

    }
    
    func configureSecondaryTitleLabel() {
        secondaryText.font = UIFont(name: "Apple SD Gothic Neo", size: 12)
        secondaryText.textColor = UIColor.white

    }
    
    //MARK: Subviews constraints
    
    func setSectionTitleLabelConstraints() {
        sectionLabelText.translatesAutoresizingMaskIntoConstraints = false
        sectionLabelText.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        sectionLabelText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setMainLabelLabelConstraints() {
        mainTitleText.translatesAutoresizingMaskIntoConstraints = false
        mainTitleText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        mainTitleText.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }
    
    func setSecondaryLabelConstraints() {
        secondaryText.translatesAutoresizingMaskIntoConstraints = false
        secondaryText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        secondaryText.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }
    
    
    
}

     //MARK: Extension

extension PhoneCodesCell {
    private func configureCell() {
        addSubview(sectionLabelText)
        addSubview(mainTitleText)
        addSubview(secondaryText)
        addSubview(cellArrowImage)
        
        configureSectionTitleLabel()
        configureMainTitleLabel()
        configureSecondaryTitleLabel()
        
        setSectionTitleLabelConstraints()
        setMainLabelLabelConstraints()
        setSecondaryLabelConstraints()
    }
}





