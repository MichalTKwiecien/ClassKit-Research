//
//  ExerciseType.swift
//  ClassKit Research
//


protocol ExerciseType {
    
    /// Question that the user will be asked
    var question: String { get }
    
    /// Available answers
    var answers: [Answer] { get }
    
    /// Validates if given answer is correct
    ///
    /// - Parameter answer: Selected answer
    /// - Returns: Value indicating if answer was correct
    func validate(answer: Answer) -> Bool
}

extension ExerciseType {
    
    func validate(answer: Answer) -> Bool {
        return answer.correct
    }
}
