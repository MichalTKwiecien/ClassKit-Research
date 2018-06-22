//
//  Module.swift
//  ClassKit Research
//


class Module: Equatable {
    
    let title: String
    var exercises: [ExerciseType]
    
    init(title: String, exercises: [ExerciseType]) {
        self.title = title
        self.exercises = exercises
    }
    
    var nextUnansweredExercise: ExerciseType? {
        return exercises.filter { $0.state == .unanswered }.first
    }
    
    func validate(answer: Answer, for exercise: ExerciseType) {
        guard let index = exercises.index(where: { element -> Bool in
            return element.question == exercise.question
        }) else { return }
        
        exercises[index].state = .answered(correct: answer.correct)
    }
    
    func start() {
        for i in 0..<exercises.count {
            exercises[i].state = .unanswered
        }
    }
    
    static func == (lhs: Module, rhs: Module) -> Bool {
        return lhs.title == rhs.title
    }
}
