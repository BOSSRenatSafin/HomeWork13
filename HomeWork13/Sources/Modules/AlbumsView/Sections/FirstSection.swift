//
//  FirstSection.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 01.02.2022.
//

import UIKit

class FirstSection {
    static func addFirstSection() -> [SettingsSection] {
        return [SettingsSection(typeCell: .twoRowCells, title: "Мои альбомы", button: "См все", albums:
                                    [Album(imegeName: "pic - 2", nameCell: "Недавние", countFotoToCell: "15"),
                                     Album(imegeName: "pic - 3", nameCell: "Избранное", countFotoToCell: "543"),
                                     Album(imegeName: "pic - 4", nameCell: "Instagram", countFotoToCell: "100"),
                                     Album(imegeName: "pic - 5", nameCell: "WhatsApp", countFotoToCell: "44"),
                                     Album(imegeName: "pic - 6", nameCell: "Telegram", countFotoToCell: "87"),
                                     Album(imegeName: "pic - 7", nameCell: "Documents", countFotoToCell: "30"),
                                     Album(imegeName: "pic - 8", nameCell: "Живопись", countFotoToCell: "1003"),
                                     Album(imegeName: "pic - 9", nameCell: "Тачки", countFotoToCell: "934")
                                    ])
        ]
    }
}
