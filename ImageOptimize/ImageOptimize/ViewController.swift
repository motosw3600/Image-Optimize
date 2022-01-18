//
//  ViewController.swift
//  ImageOptimize
//
//  Created by 박상우 on 2022/01/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTouchedRequestButton(_ sender: Any) {
        guard let path = Bundle.main.path(forResource: "background", ofType: "jpeg") else { return }
        let url = NSURL(fileURLWithPath: path)
        self.imageView.image = self.downsampleWithImageIO(url, maxSize: 300)
    }
    
    func downsampleWithImageIO(_ URL:NSURL, maxSize:Float) -> UIImage? {
        let sourceOptions = [kCGImageSourceShouldCache:false] as CFDictionary
        guard let source = CGImageSourceCreateWithURL(URL as CFURL, sourceOptions) else { return nil }
        let downsampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways:true,
            kCGImageSourceThumbnailMaxPixelSize:maxSize,
            kCGImageSourceShouldCacheImmediately:true,
            kCGImageSourceCreateThumbnailWithTransform:true
        ] as CFDictionary
        guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(source, 0, downsampleOptions) else {
            return nil
        }
        
        return UIImage(cgImage: downsampledImage)
    }
}

