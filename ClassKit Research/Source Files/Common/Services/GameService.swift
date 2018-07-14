//
//  GameService.swift
//  ClassKit Research
//


import ClassKit

final class GameService {
    
    private(set) var modules = [Module]()
    
    init() {
        modules.append(ExerciseModuleGeneratorService.generateEasyMathModule1(for: self))
        modules.append(ExerciseModuleGeneratorService.generateEasyMathModule2(for: self))
        setupClassKit()
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
    
    private func setupClassKit() {
        // Create contexts
        var contextsCoCreate: [String: CLSContext] = [:]
        for module in modules {
            let context = CLSContext(type: .quiz, identifier: module.identifier, title: module.title)
            contextsCoCreate[context.identifier] = context
        }
        
        // Add contexts to parent only if they didn't exist before
        let parent = CLSDataStore.shared.mainAppContext
        let predicate = NSPredicate(format: "parent = %@", parent)
        CLSDataStore.shared.contexts(matching: predicate) { (contexts, errror) in
            contexts.forEach { contextsCoCreate.removeValue(forKey: $0.identifier) }
            contextsCoCreate.forEach { parent.addChildContext($0.value) }
            
            // Save our changes
            CLSDataStore.shared.save { (error) in
                print(error ?? "no error")
            }
        }
    }
}
