//
//  ModuleQuizViewController.swift
//  ClassKit Research
//


final class ModuleQuizViewController: TypedViewController<ModuleQuizView>, ExerciseViewDelegate {

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
            dismiss(animated: animated)
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
