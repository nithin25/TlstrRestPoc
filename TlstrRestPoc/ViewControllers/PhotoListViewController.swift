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
        fetchAndFeedContentsToPhotoListView()
    }
    
    func setupUI() {
        photoListView = PhotoListView()
        photoListView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(photoListView)
        
        photoListView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        photoListView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        photoListView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        photoListView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func fetchAndFeedContentsToPhotoListView() {
        NetworkManager().fetch(resource: Facts.factsUrl) { [weak self] response in
            switch response {
                case .failure(let error):
                    self?.showRequestFailureAlert(error)
                case .success(let facts):
                    self?.title = facts.title
                    self?.photoListView.factsViewModel = FactsViewModel(facts)
            }
        }
    }
    
    func showRequestFailureAlert(_ error: Error) {
        print(error.localizedDescription)
        let alert = UIAlertController(title: nil, message: "There is some problem in fetching lists.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
