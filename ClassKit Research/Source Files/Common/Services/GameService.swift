//
//  GameService.swift
//  ClassKit Research
//


import ClassKit

final class GameService {
    
    private(set) var modules = [Module]()
    
    private var currentActivity: CLSActivity?
    
    init() {
        modules.append(ExerciseModuleGeneratorService.generateEasyMathModule1(for: self))
        modules.append(ExerciseModuleGeneratorService.generateEasyMathModule2(for: self))
        setupClassKit()
    }
    
    func didStart(module: Module) {
        // Start ClassKit Activity
        CLSDataStore.shared.mainAppContext.descendant(matchingIdentifierPath: [module.identifier]) { context, error in
            guard let context = context else { return }
            context.becomeActive()
            self.currentActivity = context.createNewActivity()
            self.currentActivity?.start()
        }
    }
    
    func didUpdatedAnswerInside(module: Module) {
        guard let currentActivity = currentActivity else { return }
        var answeredExercises: [ExerciseType] = []
        for element in module.exercises {
            switch element.state {
            case .answered(_):
                answeredExercises.append(element)
            default: continue
            }
        }
        guard let lastAnswered = answeredExercises.last else { return }
        let item = CLSBinaryItem(identifier: lastAnswered.identifier, title: lastAnswered.question, type: .passFail)
        if case ExerciseState.answered(correct: true) = lastAnswered.state {
            item.value = true
        } else {
            item.value = false
        }
        currentActivity.addAdditionalActivityItem(item)
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
            CLSDataStore.shared.save()
        }
    }
}
