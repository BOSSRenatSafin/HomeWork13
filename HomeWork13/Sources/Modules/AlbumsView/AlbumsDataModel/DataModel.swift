//
//  DataModel.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 01.02.2022.
//

import UIKit

struct SettingsSection: Hashable {
    let typeCell: TypeSection
    let title: String
    let button: String?
    let albums: [Album]
}

enum TypeSection {
    case oneRowCells
    case twoRowCells
    //case listCells
}

struct Album: Decodable, Hashable {
    let imegeName: String
    let nameCell: String
    let countFotoToCell: String
}
