//
//  photoTableViewCell.swift
//  TlstrRestPoc
//
//  Created by Nithin Kumar on 15/06/2019.
//  Copyright © 2019 Nithin Kumar. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    var photoimageView: UIImageView!
    var titleLable: UILabel!
    var descriptionLabel: UILabel!
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setupUI() {
        photoimageView = UIImageView()
        photoimageView.contentMode = .scaleAspectFit
        photoimageView.translatesAutoresizingMaskIntoConstraints = false
        photoimageView.backgroundColor = .gray
        contentView.addSubview(photoimageView)
        
        titleLable = UILabel()
        titleLable.numberOfLines = 0
        titleLable.lineBreakMode = .byWordWrapping
        titleLable.font = UIFont.boldSystemFont(ofSize: 15)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLable)
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
        let margineGuide = contentView.layoutMarginsGuide
        photoimageView.leadingAnchor.constraint(equalTo: margineGuide.leadingAnchor).isActive =  true
        photoimageView.topAnchor.constraint(equalTo: margineGuide.topAnchor).isActive = true
        photoimageView.trailingAnchor.constraint(equalTo: margineGuide.trailingAnchor).isActive = true
        photoimageView.heightAnchor.constraint(equalToConstant: 150)
        
        titleLable.leadingAnchor.constraint(equalTo: photoimageView.leadingAnchor).isActive = true
        titleLable.topAnchor.constraint(equalTo: photoimageView.bottomAnchor, constant: 1).isActive = true
        titleLable.trailingAnchor.constraint(equalTo: photoimageView.trailingAnchor).isActive = true
        titleLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(equalTo: photoimageView.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 1).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo:photoimageView.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: margineGuide.bottomAnchor).isActive = true
    }
}
