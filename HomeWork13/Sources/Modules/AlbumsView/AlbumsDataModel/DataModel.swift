//
//  DataModel.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 01.02.2022.
//

import UIKit

struct SettingsSection {
    let typeCell: TypeSection
    let title: String
    let button: String?
    let albums: [Album]
}

enum TypeSection {
    case oneRowCells
    case twoRowCells
    case listCells
}

struct Album {
    let imegeName: String
    let nameCell: String
    let countFotoToCell: String
}

extension SettingsSection {
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
    
    static func addSecondSection() -> [SettingsSection] {
        return [SettingsSection(typeCell: .oneRowCells, title: "Люди и места", button: "См все", albums:
                                    [Album(imegeName: "pic - 2", nameCell: "Люди", countFotoToCell: "15"),
                                     Album(imegeName: "pic - 3", nameCell: "Места", countFotoToCell: "543"),
                                     Album(imegeName: "pic - 4", nameCell: "Документа", countFotoToCell: "100"),
                                     Album(imegeName: "pic - 5", nameCell: "WhatsApp", countFotoToCell: "44")
                                    ])
        ]
    }
    
    static func addThirdSection() -> [SettingsSection] {
        return [SettingsSection(typeCell: .listCells, title: "Люди и места", button: nil, albums:
                                    [Album(imegeName: "video", nameCell: "Видео", countFotoToCell: "15"),
                                     Album(imegeName: "person.crop.square", nameCell: "Селфи", countFotoToCell: "543"),
                                     Album(imegeName: "livephoto", nameCell: "Фото", countFotoToCell: "100"),
                                     Album(imegeName: "cube", nameCell: "Пейзажи", countFotoToCell: "44"),
                                     Album(imegeName: "timelapse", nameCell: "Таймплас", countFotoToCell: "15"),
                                     Album(imegeName: "slowmo", nameCell: "Снимок", countFotoToCell: "543"),
                                     Album(imegeName: "record.circle", nameCell: "Запись", countFotoToCell: "100"),
                                     Album(imegeName: "camera.viewfinder", nameCell: "WhatsApp", countFotoToCell: "44")
                                    ])
        ]
    }
    
    static func addfourthSection() -> [SettingsSection] {
        return [SettingsSection(typeCell: .listCells, title: "Другое", button: nil, albums:
                                    [Album(imegeName: "square.and.arrow.down", nameCell: "Импортированные", countFotoToCell: "55"),
                                     Album(imegeName: "eye.slash", nameCell: "Скрытые", countFotoToCell: "53"),
                                     Album(imegeName: "trash", nameCell: "Недавно удаленные", countFotoToCell: "10")
                                    ])
        ]
    }
}
