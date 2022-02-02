//
//  FourthSection.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 02.02.2022.
//

import UIKit

class FourthSection {
    static func addfourthSection() -> [SettingsSection] {
        return [SettingsSection(typeCell: .listCells, title: "Другое", button: nil, albums:
                                    [Album(imegeName: "square.and.arrow.down", nameCell: "Импортированные", countFotoToCell: "55"),
                                     Album(imegeName: "eye.slash", nameCell: "Скрытые", countFotoToCell: "53"),
                                     Album(imegeName: "trash", nameCell: "Недавно удаленные", countFotoToCell: "10")
                                    ])
        ]
    }
}
