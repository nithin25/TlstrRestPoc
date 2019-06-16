//
//  photoTableViewCell.swift
//  TlstrRestPoc
//
//  Created by Nithin Kumar on 15/06/2019.
//  Copyright © 2019 Nithin Kumar. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class PhotoTableViewCell: UITableViewCell {
    var photoImageView: UIImageView!
    var titleLable: UILabel!
    var descriptionLabel: UILabel!
    let photoImageViewHeight: CGFloat = 300.0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
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
        photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.backgroundColor = .gray
        contentView.addSubview(photoImageView)
        
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
        
        let marginGuide = contentView.layoutMarginsGuide
        photoImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive =  true
        photoImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: photoImageViewHeight)
        
        titleLable.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor).isActive = true
        titleLable.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 1).isActive = true
        titleLable.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor).isActive = true
        titleLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 1).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo:photoImageView.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
    }
    
    func configure(_ viewModel: RowViewModel) {
        titleLable.text = viewModel.title
        descriptionLabel.text = viewModel.description
        //TODO: Setimage
        let defaultImage = UIImage(named: "unavailable")
        if let url = viewModel.url {
            let marginGuideFrame = contentView.layoutMarginsGuide.layoutFrame
            let size = CGSize(width: marginGuideFrame.width, height: photoImageViewHeight)
            
            photoImageView.af_setImage(withURL: url,
                                       placeholderImage: defaultImage,
                                       filter: AspectScaledToFitSizeFilter(size: size),
                                       imageTransition: .crossDissolve(0.5),
                                       runImageTransitionIfCached: true)
        } else {
            photoImageView.image = defaultImage
        }
    }
}
