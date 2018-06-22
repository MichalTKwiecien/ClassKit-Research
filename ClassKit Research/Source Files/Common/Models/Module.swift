//
//  Module.swift
//  ClassKit Research
//


struct Module {
    
    let title: String
    let exercises: [ExerciseType]
    
    var allExercisesDone: Bool {
        return exercises.filter { $0.state == .unanswered }.count == 0
    }
}
