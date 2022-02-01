//
//  SecondSection.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 01.02.2022.
//

import UIKit

class SecondSection {
    static func addSecondSection() -> [SettingsSection] {
        return [SettingsSection(typeCell: .oneRowCells, title: "Люди и места", button: "Все", albums:
                                    [Album(imegeName: "pic - 2", nameCell: "Люди", countFotoToCell: "15"),
                                     Album(imegeName: "pic - 3", nameCell: "Места", countFotoToCell: "543"),
                                     Album(imegeName: "pic - 4", nameCell: "Документа", countFotoToCell: "100"),
                                     Album(imegeName: "pic - 5", nameCell: "WhatsApp", countFotoToCell: "44")
                                    ])
        ]
    }
}
