//
//  GameService.swift
//  ClassKit Research
//


final class GameService {
    
    private(set) var modules = [Module]()
    
    init() {
        modules.append(ExerciseModuleGeneratorService.generateEasyMathModule(for: self))
    }
    
    func didStart(module: Module) {
        // TODO: Integrate with ClassKit
    }
    
    func didUpdatedAnswerInside(module: Module) {
        // TODO: Integrate with ClassKit
    }
    
    func didFinish(module: Module) {
        // TODO: Integrate with ClassKit
    }
}
