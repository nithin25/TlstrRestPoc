//
//  FactsViewModel.swift
//  TlstrRestPoc
//
//  Created by Nithin Kumar on 15/06/2019.
//  Copyright © 2019 Nithin Kumar. All rights reserved.
//

import Foundation
class FactsViewModel {
    let title: String
    let rowVieWModels: [RowViewModel]
    
    
    init(_ facts: Facts) {
        self.title = facts.title
        self.rowVieWModels = facts.rows.map{ RowViewModel(row: $0) }
    }
    
    func rowViewModelAtIndex(_ index: Int) -> RowViewModel {
        return self.rowVieWModels[index]
    }
}

struct RowViewModel {
    let row: Row
}

extension RowViewModel {
    var title: String {
        return self.row.title ?? "Title Unavailable"
    }
    
    var description: String {
        return self.row.description ?? "Description Unavailable"
    }
    
}