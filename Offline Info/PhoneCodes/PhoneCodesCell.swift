//
//  PhoneCodesCell.swift
//  Offline Info
//
//  Created by Вячеслав Кремнев on 26.10.2022.
//

import UIKit

class PhoneCodesCell: UITableViewCell {
    
   // let isCellSelected: Bool!
    
    lazy var cellArrowImage: UIImageView = {
        let cellArrowImage = UIImageView()
        cellArrowImage.image = UIImage(systemName: "chevron.right")
        //setImageConstraints()
        
        return cellArrowImage
    }()

    lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont(name: "Optima", size: 18)
        
        return mainLabel
    }()
    
    lazy var secondaryLabel: UILabel = {
       let secondaryLabel = UILabel()
        secondaryLabel.font = UIFont(name: "Optima", size: 14)
        print("im lazy")
        return secondaryLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviewAndConstraints()
        print("override cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setImageConstraints() {
        cellArrowImage.translatesAutoresizingMaskIntoConstraints = false
        cellArrowImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellArrowImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
//        cellArrowImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 200).isActive = true
//        cellArrowImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
//        cellArrowImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        print("use constraints")
    }

    private func setMainLabelConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }
    
    private func setSecondaryLabelConstraints() {
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        secondaryLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    private func addSubviewAndConstraints() {
        addSubview(cellArrowImage)
        addSubview(mainLabel)
        addSubview(secondaryLabel)
        setImageConstraints()
        setMainLabelConstraints()
        setSecondaryLabelConstraints()
    }
}

//
//class NewsCell: UITableViewCell {
//    
//    private let newsImageView = NewsImageView()//
//    private let newsTitleLabel = UILabel()
//    
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configureViewAndConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("Storyboard is not in use")
//    }
//    
//    //MARK: Cell Fetch Data Methods
//    func setNewsImage(url: String) {
//        DispatchQueue.main.async {
//            self.newsImageView.fetchImage(from: url)
//            print("DONE")
//        }
//    }
//    
////    func setTitleText(url: String, titleIndex: Int) {
////        NetworkManager.shared.fetchData(url) { news in
////            DispatchQueue.main.async {
////                self.newsTitleLabel.text = news.news[titleIndex].title
////            }
////        }
////    }
//    
//    
//    //MARK: Configure Cell And Constraints
//    private func configureImageView() {
//        newsImageView.layer.cornerRadius = 10
//        newsImageView.clipsToBounds = true
//    }
//    
//    private func configureTitleLabel() {
//        newsTitleLabel.font = UIFont.systemFont(ofSize: 14)
//        newsTitleLabel.numberOfLines = 0
//    }
//    
//    private func setImageConstraints() {
//        newsImageView.translatesAutoresizingMaskIntoConstraints = false
//        newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
//        newsImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 16/9).isActive = true
//        
//    }
//    
//    private func setTitleConstraints() {
//        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        newsTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 20).isActive = true
//        newsTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        
//    }
//    
//    private func configureViewAndConstraints() {
//        addSubview(newsImageView)
//        addSubview(newsTitleLabel)
//        configureImageView()
//        configureTitleLabel()
//        setImageConstraints()
//        setTitleConstraints()
//    }
//}
//
//
