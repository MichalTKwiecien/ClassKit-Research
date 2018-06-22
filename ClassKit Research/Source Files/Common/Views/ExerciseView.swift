//
//  ExerciseView.swift
//  ClassKit Research
//


import UIKit

final class ExerciseView: View, ViewSetupable {
    
    private var exercise: Exercise!
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 24)
        view.textAlignment = .center
        return view.layoutable()
    }()
    
    func setup(with exercise: Exercise) {
        titleLabel.text = exercise.question
    }
    
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
        backgroundColor = .lightGray
    }
}
