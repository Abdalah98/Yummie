//
//  Helper+Ext.swift
//  News
//
//  Created by Abdallah on 8/11/21.
//

import Foundation
import UIKit
import SafariServices
extension  UIViewController {
    
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
//    
//    func showLoadingView(){
//        DispatchQueue.main.async {
//            self.view.makeToastActivity(.center)
//        }
//    }
//    
//    func dismissLoadingView(){
//        DispatchQueue.main.async {
//            self.view.hideToastActivity()
//        }
//    }
    
    func goSafari(urlString: String){
    guard let url = URL(string:urlString ) else {return}
    let safariVC = SFSafariViewController(url: url)
    safariVC.preferredControlTintColor = .systemRed
    self.present(safariVC, animated: true)
    }
    static var identifier:String{
        return String(describing: self)
    }
    static func instantiate() -> Self{
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(identifier: identifier) as! Self
    }
}
