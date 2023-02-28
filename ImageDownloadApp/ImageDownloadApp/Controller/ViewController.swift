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

    
    //MARK: - Set ImageView tag (ImageView tag 설정)
    func setImageViewTag() {
        print(#function)
        
        imageView1.tag = 0
        imageView2.tag = 1
        imageView3.tag = 2
        imageView4.tag = 3
        imageView5.tag = 4
    }
    
    
    //MARK: - Set Button tag (Button tag 설정)
    func setButtonTag() {
        print(#function)
        
        loadButton1.tag = 0
        loadButton2.tag = 1
        loadButton3.tag = 2
        loadButton4.tag = 3
        loadButton5.tag = 4
    }
    
    
    //MARK: - clear some ImageView (ImageView 초기화 / tag 별)
    func clearImageView(tag: Int) {
        print(#function)
        print("tag: \(tag)")
        
        guard let clearImage = UIImage(systemName: "photo") else { print("Can not clear Image"); return }   // 초기화 이미지
        
        let imageArray = [imageView1, imageView2, imageView3, imageView4, imageView5]
        
        for image in imageArray {
            guard let imageView = image else { return }

            if imageView.tag == tag {
                imageView.image = clearImage
            }
        }
    }
    
    
    
    //MARK: - clear all ImageView (ImageView 초기화 / 모두)
    func clearAllImageView() {
        print(#function)

        for i in 0...4 {
            self.clearImageView(tag: i)
        }
    }

    
    //MARK: - update some ImageView (ImageView 업데이트 / tag 별)
    @IBAction func updateSomeImageView(_ sender: UIButton) {
        print(#function)
        
        let tag = sender.tag
        print("tag: \(tag)")
        
        clearImageView(tag: tag)
        loadImageForTag(tag: tag)
    }
    
    
    //MARK: - update all ImageView (ImageView 업데이트 / 모두)
    @IBAction func updateAllImageView(_ sender: UIButton) {
        print(#function)
        
        clearAllImageView()
        
        for i in 0...4 {
            loadImageForTag(tag: i)
        }
    }
    
    
    //MARK: - load Image for tag (url을 통한 ImageView 업데이트 / tag 별)
    func loadImageForTag(tag: Int) {
        print(#function)
        
        let urlString = ImageData.imageUrlArray[tag]
        guard let url = URL(string: urlString) else { return }
        
        let imageArray = [imageView1, imageView2, imageView3, imageView4, imageView5]

        for image in imageArray {
            guard let imageView = image else { return }

            if imageView.tag == tag {
                imageView.loadImage(url: url)
            }
        }
    }
    
    


}

