//
//  ModuleQuizView.swift
//  ClassKit Research
//


import UIKit

final class ModuleQuizView: View, ViewSetupable {
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 24)
        view.textAlignment = .center
        return view.layoutable()
    }()
    
    func setupViewHierarchy() {
        [titleLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        titleLabel.constraintToSuperviewEdges(excludingAnchors: [.bottom])
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupProperties() {
        backgroundColor = .white
    }
}
