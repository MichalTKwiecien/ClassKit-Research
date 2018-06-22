//
//  ExerciseView.swift
//  ClassKit Research
//


import UIKit

protocol ExerciseViewDelegate: class {
    func exerciseView(_ view: ExerciseView, didSelect answer: Answer, forExercise exercise: ExerciseType)
}

final class ExerciseView: View, ViewSetupable {
    
    private var exercise: ExerciseType!
    
    private weak var delegate: ExerciseViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 38, weight: .bold)
        view.textAlignment = .center
        return view.layoutable()
    }()
    
    private lazy var answer1Button = UIButton.makeAnswerButton()
    
    private lazy var answer2Button = UIButton.makeAnswerButton()
    
    private lazy var answer3Button = UIButton.makeAnswerButton()
    
    private lazy var answer4Button = UIButton.makeAnswerButton()
    
    private var answerButtons: [UIButton] {
        return [answer1Button, answer2Button, answer3Button, answer4Button]
    }
    
    private lazy var horizontal1StackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [answer1Button, answer2Button])
        view.axis = .horizontal
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var horizontal2StackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [answer3Button, answer4Button])
        view.axis = .horizontal
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [horizontal1StackView, horizontal2StackView])
        view.axis = .vertical
        view.spacing = 20
        view.distribution = .fillEqually
        return view.layoutable()
    }()
    
    func setup(with exercise: ExerciseType) {
        self.exercise = exercise
        titleLabel.text = exercise.question
        for i in 0...3 {
            answerButtons[i].setTitle(exercise.answers[i].value, for: .normal)
        }
    }
    
    func setupViewHierarchy() {
        [titleLabel, verticalStackView].forEach(addSubview)
    }
    
    func setupConstraints() {
        titleLabel.constraintToSuperviewEdges(excludingAnchors: [.bottom])
        verticalStackView.constraintToSuperviewEdges(withInsets: .init(top: 100, left: 40, bottom: 60, right: 40))
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setupProperties() {
        answerButtons.forEach {
            $0.addTarget(self, action: #selector(didTapAnswerButton(_:)), for: .touchUpInside)
        }
        backgroundColor = .white
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
    }
    
    @objc private func didTapAnswerButton(_ button: UIButton) {
        guard let answerIndex = answerButtons.index(of: button) else {
            fatalError("Wrong answers model provided")
        }
        delegate?.exerciseView(self, didSelect: exercise.answers[answerIndex], forExercise: exercise)
    }
}

private extension UIButton {
    
    static func makeAnswerButton() -> UIButton {
        let view = UIButton(type: .system)
        view.titleLabel?.font = .systemFont(ofSize: 48)
        view.titleLabel?.textAlignment = .center
        view.tintColor = .white
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        return view
    }
}
