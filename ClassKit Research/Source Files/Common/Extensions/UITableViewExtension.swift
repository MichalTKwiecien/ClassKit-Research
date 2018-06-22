//
//  UITableViewExtension.swift
//  ClassKit Research
//


import UIKit

internal extension UITableView {
    
    /// - SeeAlso: UITableView.register
    func register<T: UITableViewCell>(cell: T.Type) {
        register(T.self, forCellReuseIdentifier: T.className)
    }
    
    /// - SeeAlso: UITableView.dequeueReusableCell
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T
    }
}
