//
//  ImageIOConverter.swift
//  ImageOptimize
//
//  Created by 박상우 on 2022/02/19.
//

import UIKit
import ImageIO

struct ImageIOConverter {
    static func resize(url: URL) -> UIImage {
        guard let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil) else {
            fatalError("Can not get ImageSource")
        }
        
        let scaledOptions: [NSString: Any] = [
            kCGImageSourceThumbnailMaxPixelSize: 300,
            kCGImageSourceCreateThumbnailFromImageAlways: true
        ]
        
        guard let scaledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, scaledOptions as CFDictionary) else {
            fatalError("Can not get scaledImage")
        }
        
        return UIImage(cgImage: scaledImage)
    }
}
