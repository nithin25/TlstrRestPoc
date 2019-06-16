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
    var factsViewModel: FactsViewModel? {
        didSet {
            self.photoListTableView.reloadData()
        }
    }
    
    
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
    
    /**
     Setup UI for this view by setting proper constraints.
     */
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
    
    /**
     Reset view model to nil and reload table to not dispay any contents.
     */
    func resetFactsList() {
        factsViewModel = nil
    }
}

//MARK: UITableView Datasource methods
extension PhotoListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.factsViewModel?.rowVieWModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PhotoTableViewCell
        if let viewModel = self.factsViewModel?.rowViewModelAtIndex(indexPath.row) {
            cell.configure(viewModel)
        }
        return cell
    }
}

