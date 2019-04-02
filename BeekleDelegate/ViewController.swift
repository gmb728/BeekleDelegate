//
//  ViewController.swift
//  BeekleDelegate
//
//  Created by Chang Sophia on 4/1/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
   
  
    let images = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
    var frame = CGRect(x:0, y:0, width:0, height:0)
  
    var x: CGFloat = 0
    var y: CGFloat = 0
    var z: CGFloat = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
           let imageWidth = scrollView.frame.width
        pageControl.numberOfPages = images.count
        for i in 0..<images.count {
            frame.origin.x = imageWidth * CGFloat(i)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[i])
            self.scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height:scrollView.frame.size.height)
        
        scrollView.delegate = self
        
        x = x + imageWidth
        y = y + imageWidth
        z = z + imageWidth
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        
    }
   
  
}
