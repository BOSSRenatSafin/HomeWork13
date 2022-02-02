//
//  ThirdSection.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 01.02.2022.
//

import UIKit

class ThirdSection {
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
}
