//
//  NetworkService.swift
//  TopPictures_TestTask
//
//  Created by Vitalii on 18.04.2020.
//  Copyright © 2020 Vitalii Andrianov. All rights reserved.
//

import Foundation

class NetworkService {
    
    func getGallery(completion: @escaping ([Picture]?) -> Void) {
        guard let url = URL(string: "https://api.imgur.com/3/gallery/top/top/week/1") else { return }
        var request = URLRequest(url: url)
        request.addValue("Client-ID f908b23737ce05f", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!, error!.localizedDescription)
                return
            }
            guard let data = data else {
                print("There's no data in the response")
                return
            }
            if let picturesArray = self.decodePictures(data) {
                completion(picturesArray)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    func getComments(for picture: Picture, complition: @escaping ([CommentData]?) -> Void) {
        guard let url = URL(string: "https://api.imgur.com/3/gallery/\(picture.galleryID)/comments/best") else { return }
        var request = URLRequest(url: url)
        request.addValue("Client-ID f908b23737ce05f", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!, error!.localizedDescription)
                return
            }
            guard let data = data else {
                print("There's no data in the response")
                return
            }
            if let responseObject = try? JSONDecoder().decode(Comments.self, from: data) {
                if let pictureDetailData = responseObject.data {
                    complition(pictureDetailData)
                } else {
                    complition(nil)
                }
            }
        }.resume()
    }
    
    func getPictureInfo(for picture: Picture, complition: @escaping (PictureDetailData?) -> Void) {
        guard let url = URL(string: "https://api.imgur.com/3/image/\(picture.pictureID)") else { return }
        var request = URLRequest(url: url)
        request.addValue("Client-ID f908b23737ce05f", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!, error!.localizedDescription)
                return
            }
            guard let data = data else {
                print("There's no data in the response")
                return
            }
            if let responseObject = try? JSONDecoder().decode(PictureDetail.self, from: data) {
                if let pictureDetailData = responseObject.data {
                    complition(pictureDetailData)
                } else {
                    complition(nil)
                }
            }
        }.resume()
    }

    private func decodePictures(_ data: Data) -> [Picture]? {
        if let responseObject = try? JSONDecoder().decode(Gallery.self, from: data) {
            var pictures = [Picture]()
            if let data = responseObject.data {
                data.forEach {
                    let mediaType = $0.images?.first?.type
                    guard mediaType == "image/jpeg" || mediaType == "image/png" else {
                        return
                    }
                    guard let validLink = $0.images?.first?.link,
                        let galleryID = $0.id,
                        let pictureID = $0.images?.first?.id else {
                            return
                    }
                    let title = $0.title ?? ""
                    let picture = Picture(title: title,
                                          link: validLink,
                                          galleryID: galleryID,
                                          pictureID: pictureID)
                    pictures.append(picture)
                }
            }
            return pictures
        }
        return nil
    }
    
}
