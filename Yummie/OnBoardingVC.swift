//
//  ViewController.swift
//  Yummie
//
//  Created by Abdallah on 1/15/22.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var slides = [
        OnBoardingSlid(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
        OnBoardingSlid(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
        OnBoardingSlid(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
    ]
    
    var currentPage = 0{
        
        didSet{
            pageControl.currentPage = currentPage
            
            if currentPage == slides.count - 1 {
                
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = slides.count
        
        let nib = UINib(nibName: Cell.onboardingCell, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Cell.onboardingCell)
    }
    
    
    @IBAction func nextBtnAction(_ sender: Any) {
        if  currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(identifier: "Home") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            //            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
//
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
//            let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//            vc.modalPresentationStyle = .fullScreen
//            controller.modalTransitionStyle = .flipHorizontal
//            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        
    }
}

extension OnBoardingVC: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        cell.setup(result: slides[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        // 34an ya3rf an hana a5er el screen or cell hy3rfana current page
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
