//
//  ModuleQuizViewController.swift
//  ClassKit Research
//

protocol ModuleQuizViewControllerDelegate: class {
    func moduleQuizViewController(_ viewController: ModuleQuizViewController, didFinishModule module: Module)
}

final class ModuleQuizViewController: TypedViewController<ModuleQuizView>, ExerciseViewDelegate {

    weak var delegate: ModuleQuizViewControllerDelegate?
    
    private let module: Module
    
    init(module: Module, viewMaker: @autoclosure @escaping () -> View) {
        self.module = module
        super.init(viewMaker: viewMaker() as! ModuleQuizView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.exerciseView.delegate = self
        customView.titleLabel.text = module.title
        showNextExerciseOrDismiss(animated: false)
    }
    
    private func showNextExerciseOrDismiss(animated: Bool) {
        guard let nextExercise = module.nextUnansweredExercise else {
            dismiss(animated: animated, completion: { [unowned self] in
                self.delegate?.moduleQuizViewController(self, didFinishModule: self.module)
            })
            return
        }
        customView.exerciseView.setup(with: nextExercise, animated: animated)
    }
    
    func exerciseView(_ view: ExerciseView, didSelect answer: Answer, forExercise exercise: ExerciseType) {
        module.validate(answer: answer, for: exercise)
        view.blink(success: answer.correct, completion: { [unowned self] in
            self.showNextExerciseOrDismiss(animated: true)
        })
    }
}
