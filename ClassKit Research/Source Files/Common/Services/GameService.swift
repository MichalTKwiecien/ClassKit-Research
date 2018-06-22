//
//  GameService.swift
//  ClassKit Research
//


final class GameService {
    
    lazy var exercises: [ExerciseType] = ExercisesGeneratorService.generateEasyMathExercises()
    
    init() {
        
    }
}
