//
//  GalleryList.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/04.
//

import Foundation
struct PhtoList:Hashable {
    let image : String
}
extension PhtoList {
    static let imageGrid : [PhtoList] = [PhtoList(image: "Gallery/Frame 17"),
                                  PhtoList(image: "Gallery/galleryImage1"),
                                  PhtoList(image: "Gallery/galleryImage2"),
                                  PhtoList(image: "Gallery/galleryImage3"),
                                  PhtoList(image: "Gallery/galleryImage4"),
                                  PhtoList(image: "Gallery/galleryImage5"),
                                  PhtoList(image: "Gallery/galleryImage6"),
                                  PhtoList(image: "Gallery/galleryImage7"),
                                  PhtoList(image: "Gallery/galleryImage8"),
                                  PhtoList(image: "Gallery/galleryImage10"),
                                  PhtoList(image: "Gallery/galleryImage12"),
                                  PhtoList(image: "Gallery/galleryImage13"),
                                  PhtoList(image: "Gallery/galleryImage14"),
                                  PhtoList(image: "Gallery/galleryImage15"),
                                  PhtoList(image: "Gallery/galleryImage16"),
                                  PhtoList(image: "Gallery/galleryImage17"),
                                  PhtoList(image: "Gallery/galleryImage18"),
                                  PhtoList(image: "Gallery/galleryImage19"),
                                  PhtoList(image: "Gallery/galleryImage20"),
                                  PhtoList(image: "Gallery/galleryImage21"),
                                  PhtoList(image: "Gallery/galleryImage22")
    ]
}
