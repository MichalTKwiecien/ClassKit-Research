//
//  ExerciseState.swift
//  ClassKit Research
//


enum ExerciseState: Equatable {
    case unanswered
    case answered(correct: Bool)
    
    static func == (lhs: ExerciseState, rhs: ExerciseState) -> Bool {
        switch (lhs, rhs) {
        case (.unanswered, .unanswered):
            return true
        case (.answered(let correctL), .answered(let correctR)):
            return correctL == correctR
        case (.answered(_), .unanswered):
            return false
        case (.unanswered, .answered(_)):
            return false
        }
    }
}
