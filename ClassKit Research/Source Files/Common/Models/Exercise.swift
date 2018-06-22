//
//  Exercise.swift
//  ClassKit Research
//


struct Exercise: ExerciseType, Equatable {
    
    let question: String
    let answers: [Answer]
    var state: ExerciseState = .unanswered
    
    init(question: String, answers: [Answer]) {
        self.question = question
        self.answers = answers
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.question == rhs.question
    }
}
