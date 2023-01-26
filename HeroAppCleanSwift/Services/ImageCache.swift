//
//  ImageCache.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 26.01.2023.
//

import UIKit

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
    
}
