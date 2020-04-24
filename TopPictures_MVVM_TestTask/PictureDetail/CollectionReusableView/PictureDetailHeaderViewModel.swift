//
//  PictureDetailHeaderViewModel.swift
//  TopPictures_MVVM_TestTask
//
//  Created by Vitalii on 23.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class PictureDetailHeaderViewModel: PictureDetailHeaderViewModelProtocol {
    
    private let picture: Picture
    private let pictureDetailData: PictureDetailData
    
    var pictureLink: String? {
        return picture.link
    }
    var width: String? {
        return "Width: \(pictureDetailData.width ?? 0) px"
    }
    var height: String? {
        return "Height: \(pictureDetailData.height ?? 0) px"
    }
    var size: String? {
        return "Size: \((pictureDetailData.size ?? 0).humanReadableByteCount())"
    }
    var added: String? {
        let date = Date(timeIntervalSince1970: TimeInterval(pictureDetailData.datetime ?? 0))
        let formatter = DateFormatter()
        formatter.dateFormat = "d.MM.y"
        return "Added: \(formatter.string(from: date))"
    }
    var viewsCount: String? {
        return "Views: \((pictureDetailData.views ?? 0).separatedNumber())"
    }
    
    required init(for picture: Picture, and pictureDetailData: PictureDetailData) {
        self.picture = picture
        self.pictureDetailData = pictureDetailData
    }
}

//MARK: - Int's extensions
extension Int {
    
    func humanReadableByteCount() -> String {
        if (self < 1000) { return "\(self) B" }
        let exp = Int(log2(Double(self)) / log2(1000.0))
        let unit = ["KB", "MB", "GB", "TB", "PB", "EB"][exp - 1]
        let number = Double(self) / pow(1000, Double(exp))
        return String(format: "%.1f %@", number, unit)
    }
    
    func separatedNumber() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = "."
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
}
