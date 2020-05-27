//
//  BoardingViewController.swift
//  vovy
//
//  Created by Jeremy Jason on 26/05/20.
//  Copyright © 2020 Alfon. All rights reserved.
//

import UIKit

class BoardingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var selanjutnya: UIButton!
    
    
    var images = ["depandua","depansatu"]
    
    var titles: [String] = ["Selamat datang relawan !", "Mainkan Kuisnya"]
    
    var descriptions = ["Cari dengan mudah dan temukan       kegiatan relawan yang anda minati", "Hasil kuis akan memperlihatkan bidang kerelawanan yang sesuai dengan anda"]
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    
    var collectionView: UICollectionView?
    var preferenceRecommendation = [String]()
    
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    self.view.layoutIfNeeded()
        selanjutnya.layer.cornerRadius = 10
        selanjutnya.layer.masksToBounds = true
        
           self.scrollView.delegate = self
           scrollView.isPagingEnabled = true
           scrollView.showsHorizontalScrollIndicator = false
           scrollView.showsVerticalScrollIndicator = true
           
           var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
           let txt1 = UILabel.init(frame: CGRect(x:32,y:78,width:scrollWidth-64,height:100))
        
           self.collectionView?.backgroundColor = UIColor.white
           
           for index in 0..<titles.count {
               if index < 2 {
                   frame.origin.x = scrollWidth * CGFloat(index)
                     frame.size = CGSize(width: scrollWidth, height: scrollHeight)

                     let slide = UIView(frame: frame)

                     //subviews
                     let imageView = UIImageView.init(image: UIImage.init(named: images[index]))
                     imageView.frame = CGRect(x:0,y:0,width:330,height:480)
                     imageView.contentMode = .scaleAspectFit
                     imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
                   
                     let txt1 = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY+15,width:scrollWidth-64,height:50))
                     txt1.textAlignment = .center
                     txt1.font = UIFont.boldSystemFont(ofSize: 25.0)
                     txt1.text = titles[index]

                     let txt2 = UILabel.init(frame: CGRect(x:32,y:txt1.frame.maxY+0,width:scrollWidth-64,height:50))
                     txt2.textAlignment = .center
                     txt2.numberOfLines = 3
                     txt2.font = UIFont.systemFont(ofSize: 18.0)
                txt2.textColor = UIColor.gray
                     txt2.text = descriptions[index]

                     slide.addSubview(imageView)
                     slide.addSubview(txt1)
                     slide.addSubview(txt2)
                     scrollView.addSubview(slide)
               } else {
                   frame.origin.x = scrollWidth * CGFloat(index)
                   frame.size = CGSize(width: scrollWidth, height: scrollHeight)
                   let slide = UIView(frame: frame)

                     //subviews
                   txt1.textAlignment = .center
                   txt1.numberOfLines = 5
                   txt1.font = UIFont.boldSystemFont(ofSize: 25.0)
                   txt1.text = titles[index]
                   
                   slide.addSubview(txt1)
                   slide.addSubview(self.collectionView!)
                   scrollView.addSubview(slide)

               }
               

           }

           scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)

           self.scrollView.contentSize.height = 1.0

           //initial state
           pageControl.numberOfPages = titles.count
           pageControl.currentPage = 0
           
       }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }

    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }

    
    @IBAction func toDashboard(_ sender: Any) {
        UserDefaults.standard.set(preferenceRecommendation, forKey: "preferedRecommendation")
        UserDefaults.standard.set(true, forKey: "hasLaunched")
        
        performSegue(withIdentifier: "Awalini", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AwalViewController {
            
        }
    }
    
}
