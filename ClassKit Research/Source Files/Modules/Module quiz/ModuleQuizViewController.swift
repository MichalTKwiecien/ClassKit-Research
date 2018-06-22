//
//  ModuleQuizViewController.swift
//  ClassKit Research
//


final class ModuleQuizViewController: TypedViewController<ModuleQuizView> {
    
    private let module: Module
    
    init(module: Module, viewMaker: @autoclosure @escaping () -> View) {
        self.module = module
        super.init(viewMaker: viewMaker() as! ModuleQuizView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.titleLabel.text = module.title
        showNextExercise()
    }
    
    private func showNextExercise() {
        guard let nextExercise = module.nextUnansweredExercise else { return }
        customView.exerciseView.setup(with: nextExercise)
    }
}
