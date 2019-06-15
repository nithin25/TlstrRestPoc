//
//  PhotoListViewController.swift
//  TlstrRestPoc
//
//  Created by Nithin Kumar on 15/06/2019.
//  Copyright © 2019 Nithin Kumar. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {
    var photoListView: PhotoListView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        //TODO: Make title dynamic as per json
        self.title = "Screen title"
//        if #available(iOS 11, *) {
//            self.navigationController?.navigationBar.prefersLargeTitles = true
//        }
        
        photoListView = PhotoListView()
        photoListView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(photoListView)
        
        photoListView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        photoListView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        photoListView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        photoListView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

}
