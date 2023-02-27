//
//  ViewController.swift
//  ImageDownloadApp
//
//  Created by 조주은 on 2023/02/20.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Instance
    // imageView
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    // Button
    @IBOutlet weak var loadButton1: UIButton!
    @IBOutlet weak var loadButton2: UIButton!
    @IBOutlet weak var loadButton3: UIButton!
    @IBOutlet weak var loadButton4: UIButton!
    @IBOutlet weak var loadButton5: UIButton!
    
    @IBOutlet weak var loadAllButton: UIButton!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        setImageViewTag()
        setButtonTag()
        clearAllImageView()
    }

    
    //MARK: - Set ImageView tag
    func setImageViewTag() {
        print(#function)
        
        imageView1.tag = 1
        imageView2.tag = 2
        imageView3.tag = 3
        imageView4.tag = 4
        imageView5.tag = 5
    }
    
    
    //MARK: - Set Button tag
    func setButtonTag() {
        print(#function)
        
        loadButton1.tag = 1
        loadButton2.tag = 2
        loadButton3.tag = 3
        loadButton4.tag = 4
        loadButton5.tag = 5
    }
    
    
    //MARK: - clear some ImageView
    func clearImageView(tag: Int) {
        print(#function)
        print("tag: \(tag)")
        
        let imageArray = [imageView1, imageView2, imageView3, imageView4, imageView5]
        let clearImage = UIImage(systemName: "photo")
        
        for image in imageArray {
            guard let imageView = image else { return }
            
            if imageView.tag == tag {
                imageView.image = clearImage
            }
        }
    }
    
    
    //MARK: - clear all ImageView
    func clearAllImageView() {
        print(#function)
        
        let imageArray = [imageView1, imageView2, imageView3, imageView4, imageView5]
        let clearImage = UIImage(systemName: "photo")
        
        for image in imageArray {
            guard let imageView = image else { return }
            imageView.image = clearImage
        }
    }

    
    //MARK: - update some ImageView
    @IBAction func updateSomeImageView(_ sender: UIButton) {
        print(#function)
        
        let tag = sender.tag
        print("tag: \(tag)")
        
        clearImageView(tag: tag)
    }
    
    
    @IBAction func updateAllImageView(_ sender: UIButton) {
        print(#function)
        
        clearAllImageView()
    }
}

