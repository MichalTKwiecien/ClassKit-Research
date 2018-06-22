//
//  GameService.swift
//  ClassKit Research
//


final class GameService {
    
    private(set) var modules = [Module]()
    
    init() {
        modules.append(ExerciseModuleGeneratorService.generateEasyMathModule())
    }
}
