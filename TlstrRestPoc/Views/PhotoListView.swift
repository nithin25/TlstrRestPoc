//
//  PhotoListView.swift
//  TlstrRestPoc
//
//  Created by Nithin Kumar on 15/06/2019.
//  Copyright © 2019 Nithin Kumar. All rights reserved.
//

import UIKit

class PhotoListView: UIView {
    var photoListTableView: UITableView!
    let cellId = "CellId"
    init() {
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    // This attribute hides `init(coder:)` from subclasses
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        photoListTableView = UITableView()
        photoListTableView.estimatedRowHeight = 200
        photoListTableView.rowHeight = UITableView.automaticDimension
        photoListTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(photoListTableView)
        photoListTableView.dataSource = self
        photoListTableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: cellId)
        
        photoListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photoListTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension PhotoListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PhotoTableViewCell
        
        //TODO: Replace with contents available in Json obtained
        cell.photoimageView.image = UIImage(named: "Imagexx")
        cell.titleLable.text = "Title"
        cell.descriptionLabel.text = "details sdbsjfgjhsdf sdfjsbdfhjgsdjfgsjdfb sjdhgjfgjhsdbf ssdjhfgsjhdgfhjsdf sdhjgsjhdgjshdgfjhsdf sjdhgfsjhdgfjhsdgfjhsgdf jhdfhjfsgdfjsgdf 123"
        
        return cell
        
    }
    
    
}


