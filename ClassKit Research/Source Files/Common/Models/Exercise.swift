//
//  Exercise.swift
//  ClassKit Research
//


struct Exercise: ExerciseType, Equatable {
    
    let identifier: String
    let question: String
    let answers: [Answer]
    var state: ExerciseState = .unanswered
    
    init(identifier: String, question: String, answers: [Answer]) {
        self.identifier = identifier
        self.question = question
        self.answers = answers
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.question == rhs.question
    }
}
