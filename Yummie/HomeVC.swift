//
//  HomeVC.swift
//  Yummie
//
//  Created by Abdallah on 1/16/22.
//

import UIKit
class HomeVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefCollectionView: UICollectionView!
    var categoy :[DishCategory] = [DishCategory(id: "dsad", name: "dsad", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg"),
                                   DishCategory(id: "dsad", name: "dsad", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg"),
                                   DishCategory(id: "dsad", name: "dsad", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg"),
                                   DishCategory(id: "dsad", name: "dsad", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg"),
                                   DishCategory(id: "dsad", name: "dsad", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg"),
                                   DishCategory(id: "dsad", name: "dsad", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg"),
                                   DishCategory(id: "dsad", name: "dsad", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg"),
                                   DishCategory(id: "dsad", name: "dsad", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg")]
    
    var popular:[Dish] = [Dish(id: "2", title: "dadas", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg", discription: "Fadfsdfdsf", calories: 2012.3),
                          Dish(id: "2", title: "dadas", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg", discription: "Fadfdsfds,fdsbfdsbnbfsdamb,fmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbfmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbfmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbfmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbnmbhjgdgffdhfsdfdsf", calories: 2012.3),
                          Dish(id: "2", title: "dadas", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg", discription: "Fadfsdfdsf", calories: 2012.3),
    ]
    
    
    var populars:[Dish] = [Dish(id: "2", title: "dadas", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg", discription: "Fadfsdfdsf", calories: 2012.3),
                          Dish(id: "2", title: "dadas", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg", discription: "Fadfsdfdsf", calories: 2012.3),
                          Dish(id: "2", title: "dadas", image: "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401_960_720.jpg", discription: "Fadfsfmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbfmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbfmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbfmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbfmdsnfbmdsnfbadsfdsmbmfbmdsfndsdsbfnmdsbfmndsfdsfbdsfhldsfhdshfhadsfhkhdshfdsalhdsfhdhdsferewrewtryuiuoknbvbdfdsf", calories: 2012.3),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yummie"
        registerCellCategory()
        registerCellPopular()
        registerCellChef()
    }
    
    private func registerCellCategory(){
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        let nib = UINib(nibName: Cell.categoryCollectionViewCell, bundle: nil)
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: Cell.categoryCollectionViewCell)
    }
    
    private func registerCellPopular(){
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        let nib = UINib(nibName: Cell.dishPortraitCollectionViewCell, bundle: nil)
        popularCollectionView.register(nib, forCellWithReuseIdentifier: Cell.dishPortraitCollectionViewCell)
    }
    
    private func registerCellChef(){
        chefCollectionView.delegate = self
        chefCollectionView.dataSource = self
        let nib = UINib(nibName: Cell.dishLandscapeCollectionViewCell, bundle: nil)
        chefCollectionView.register(nib, forCellWithReuseIdentifier: Cell.dishLandscapeCollectionViewCell)
    }
}
extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categoy.count
        case popularCollectionView:
            return popular.count
        case chefCollectionView:
            return populars.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.categoryCollectionViewCell, for: indexPath) as? CategoryCollectionViewCell else { fatalError("no found  withReuseIdentifier") }
            cell.setup(category: categoy[indexPath.item])
            return cell
        case popularCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dishPortraitCollectionViewCell, for: indexPath) as? DishPortraitCollectionViewCell else { fatalError("no found  withReuseIdentifier") }
            cell.setup(dish: popular[indexPath.item])
            return cell
        case chefCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.dishLandscapeCollectionViewCell, for: indexPath) as? DishLandscapeCollectionViewCell else { fatalError("no found  withReuseIdentifier") }
            cell.setup(dish: populars[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            
        }else {
            let controller = DishDetailsVC.instantiate()
            controller.dish = collectionView == popularCollectionView ? popular[indexPath.item] : populars[indexPath.item]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
