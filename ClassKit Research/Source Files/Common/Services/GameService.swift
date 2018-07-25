//
//  GameService.swift
//  ClassKit Research
//


// TODO 1: Import ClassKit

final class GameService {
    
    private(set) var modules = [Module]()
    
    init() {
        modules.append(ExerciseModuleGeneratorService.generateEasyMathModule1(for: self))
        modules.append(ExerciseModuleGeneratorService.generateEasyMathModule2(for: self))
        setupClassKitContexts()
    }
    
    func didStart(module: Module) {
        // TODO 4: Start new activity and save reference to it.
    }
    
    func didUpdatedAnswerInside(module: Module) {
        // TODO 5: Add additional ClassKit item with answered state to your activity.
    }
    
    func didFinish(module: Module) {
        // TODO 6: Publish score to ClassKit and finish the activity.
    }
    
    private func setupClassKitContexts() {
        // TODO 2: Create contexts with your modules and add them to `CLSDataStore.shared.mainAppContext`.
    }
}
