//
//  ImageCache.swift
//  
//
//  Created by Дмитрий Мальцев on 27.06.2022.
//

import SwiftUI

public class ImageCache {
    public var cache = NSCache<NSString, UIImage>()
    
    public func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    public func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    public static func getImageCache() -> ImageCache {
        return imageCache
    }
}
