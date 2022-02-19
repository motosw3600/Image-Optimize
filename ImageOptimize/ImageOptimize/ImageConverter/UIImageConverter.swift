//
//  UIImageConverter.swift
//  ImageOptimize
//
//  Created by 박상우 on 2022/02/19.
//

import UIKit

struct UIImageConverter {
    static func resize(image: UIImage) -> UIImage {
        let size = CGSize(width: 300, height: 300)
        
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { context in
            image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        
        return resizedImage
    }
}
