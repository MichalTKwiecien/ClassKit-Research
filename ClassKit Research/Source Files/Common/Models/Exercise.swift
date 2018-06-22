//
//  Exercise.swift
//  ClassKit Research
//


struct Exercise: ExerciseType {
    
    let question: String
    let answers: [Answer]
    var state: ExerciseState = .unanswered
    
    init(question: String, answers: [Answer]) {
        self.question = question
        self.answers = answers
    }
}
