//
//  Facts.swift
//  TlstrRestPoc
//
//  Created by Nithin Kumar on 15/06/2019.
//  Copyright © 2019 Nithin Kumar. All rights reserved.
//

import Foundation

struct Facts: Codable {
    var title: String
    var rows: [Row]
}

struct Row: Codable {
    var title: String?
    var description: String?
    var imageHref: String?
}

extension Facts {
    static var factsUrl: Resource<Facts> = {
        guard let url = URL.facts else {
            fatalError("invalid url")
        }
        return Resource<Facts>(url: url)
    }()
}
