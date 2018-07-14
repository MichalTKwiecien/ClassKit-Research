//
//  Module.swift
//  ClassKit Research
//


class Module: Equatable {
    
    weak var gameService: GameService?
    let identifier: String
    let title: String
    var exercises: [ExerciseType]
    
    init(gameService: GameService, identifier: String, title: String, exercises: [ExerciseType]) {
        self.gameService = gameService
        self.identifier = identifier
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
        gameService?.didUpdatedAnswerInside(module: self)
    }
    
    func start() {
        for i in 0..<exercises.count {
            exercises[i].state = .unanswered
        }
        gameService?.didStart(module: self)
    }
    
    func finish() {
        gameService?.didFinish(module: self)
    }
    
    func calculateScore() -> Double {
        var correctAnswers = 0.0
        for element in exercises {
            if case ExerciseState.answered(correct: true) = element.state {
                correctAnswers += 1
            }
        }
        return correctAnswers / Double(exercises.count)
    }
    
    static func == (lhs: Module, rhs: Module) -> Bool {
        return lhs.title == rhs.title
    }
}
