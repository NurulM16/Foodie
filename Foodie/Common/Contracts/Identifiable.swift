//
//  Identifiable.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import UIKit

protocol Identifiable {
    static var identifier: String {get}
}

extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIView:Identifiable{}

extension UITableViewCell: Identifiable {}

extension UICollectionViewCell: Identifiable {}

extension UICollectionReusableView: Identifiable {}

extension UIViewController: Identifiable {}

extension UITableView {
  func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
    guard let cell = dequeueReusableCell(withIdentifier: cellType.identifier,
                                         for: indexPath) as? T else {
      fatalError()
    }
    return cell
  }
  
  func register<T>(type: T.Type) where T: UITableViewCell {
    register(UINib(nibName: T.identifier, bundle: Bundle.main), forCellReuseIdentifier: T.identifier)
  }
}

extension UICollectionView {
    func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UICollectionViewCell {
      guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier,
                                           for: indexPath) as? T else {
        fatalError()
      }
      return cell
    }
    
    func register<T>(type: T.Type) where T: UICollectionViewCell {
      register(UINib(nibName: T.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: T.identifier)
    }
}

extension UIViewController {
    static func loadFromNib() -> Self {
      func instantiateFromNib<T: UIViewController>() -> T {
        return T.init(nibName: T.identifier, bundle: nil)
      }
      
      return instantiateFromNib()
    }
    
    ///Loading indicator
    func loading(status:Bool) {
        if status{
            IndicatorView.sharedInstance.showIndicator()
        }else{
            IndicatorView.sharedInstance.hideIndicator()
        }
    }
    
    ///Navigation Controller
    static func instantiate(fromStoryboardName storyboardName: String? = nil) -> Self {
           func instantiateHelper<T: UIViewController>() -> T {
               let storyboard = UIStoryboard(name: storyboardName ?? String(describing: T.self), bundle: nil)
               return storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
           }
           return instantiateHelper()
       }
}


