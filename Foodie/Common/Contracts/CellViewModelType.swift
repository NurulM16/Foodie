//
//  CellViewModelType.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import Foundation

protocol CellViewModelType {
    associatedtype T
    func configureCell(model: T)
}
