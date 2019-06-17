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

protocol PhotoTableViewCellDelagate {
    /**
     Refresh the cell using table udates.
     Use this protocol if asynchrounous updates done in this class and requires reframing the UI.
     */
    func refreshCell(_ cell: PhotoTableViewCell)
}

class PhotoTableViewCell: UITableViewCell {
    var photoImageView: UIImageView!
    var titleLable: UILabel!
    var descriptionLabel: UILabel!
    let photoImageViewHeight: CGFloat = 300.0
    var delegate: PhotoTableViewCellDelagate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        setupUI()
    }
    // This attribute hides `init(coder:)` from subclasses
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /**
     Setup UI for this view by setting proper constraints.
     */
    func setupUI() {
        photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        photoImageView.layer.cornerRadius = 5.0
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
        
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive =  true
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        photoImageView.heightAnchor.constraint(lessThanOrEqualToConstant: photoImageViewHeight)
        
        titleLable.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor).isActive = true
        titleLable.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8.0).isActive = true
        titleLable.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor).isActive = true
        
        descriptionLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8.0).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo:photoImageView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5.0).isActive = true
    }
    
    /**
     Configure the cell by setting the dynamic contents fetched.
     
     - Parameter viewModel: **ViewModel** object which contains all reuired contents to dispaly in the cell.
     */
    func configure(_ viewModel: RowViewModel) {
        titleLable.text = viewModel.title
        descriptionLabel.text = viewModel.description
        let defaultImage = UIImage(named: "unavailable")
        if let url = viewModel.url {
            photoImageView.af_setImage(withURL: url,
                                       placeholderImage: defaultImage,
                                       imageTransition: .crossDissolve(0.5),
                                       runImageTransitionIfCached: true) { [weak self] (response) in
                                        //Resizing cell after image update requires calling Tableview updates method
                                        self?.delegate?.refreshCell(self!)
            }
        } else {
            photoImageView.image = defaultImage
        }
    }
}
