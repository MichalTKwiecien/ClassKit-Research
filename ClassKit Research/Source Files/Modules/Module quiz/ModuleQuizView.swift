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
    
    lazy var exerciseView = ExerciseView().layoutable()
    
    func setupViewHierarchy() {
        [titleLabel, exerciseView].forEach(addSubview)
    }
    
    func setupConstraints() {
        titleLabel.constraintToSuperviewEdges(excludingAnchors: [.bottom])
        exerciseView.constraintToSuperviewEdges(withInsets: .init(top: 100, left: 100, bottom: 100, right: 100))
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupProperties() {
        backgroundColor = .white
    }
}
