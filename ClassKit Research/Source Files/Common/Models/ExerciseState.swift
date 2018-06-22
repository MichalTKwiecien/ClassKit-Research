//
//  ExerciseState.swift
//  ClassKit Research
//


enum ExerciseState: Equatable {
    case unanswered
    case answered(correct: Bool)
    
    static func == (lhs: ExerciseState, rhs: ExerciseState) -> Bool {
        switch (lhs, rhs) {
        case (_, _):
            return lhs == rhs
        }
    }
}
