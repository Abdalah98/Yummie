//
//  DishDetailsVC.swift
//  Yummie
//
//  Created by Abdallah on 2/24/22.
//

import UIKit
import Kingfisher
class DishDetailsVC: UIViewController {
    @IBOutlet weak var detailsImage: UIImageView!
    
    @IBOutlet weak var detailsDescriptionLabel: UILabel!
    @IBOutlet weak var detailsTitleLabel: UILabel!
    @IBOutlet weak var detailsCaloreLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    var dish:Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        populatView()
     }
    

   private func  populatView(){
    detailsTitleLabel.text = dish.title
    detailsImage.kf.setImage(with: dish.image?.asUrl)
    detailsCaloreLabel.text = dish.fomattedCalories
    detailsDescriptionLabel.text = dish.discription
    print(dish.discription)
    }
    @IBAction func palceOrderAction(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
