//
//  ExerciseModuleGeneratorService.swift
//  ClassKit Research
//


final class ExerciseModuleGeneratorService {
    
    static func generateEasyMathModule1(for service: GameService) -> Module {
        let exercise1 = Exercise(
            question: "12 + 7 = ?",
            answers: [
                Answer(value: "16", correct: false),
                Answer(value: "18", correct: false),
                Answer(value: "19", correct: true),
                Answer(value: "21", correct: false),
            ]
        )
        let exercise2 = Exercise(
            question: "2 + ? = 5",
            answers: [
                Answer(value: "1", correct: false),
                Answer(value: "3", correct: true),
                Answer(value: "4", correct: false),
                Answer(value: "5", correct: false),
            ]
        )
        let exercise3 = Exercise(
            question: "8 * 3 = ?",
            answers: [
                Answer(value: "16", correct: false),
                Answer(value: "19", correct: false),
                Answer(value: "21", correct: false),
                Answer(value: "24", correct: true),
            ]
        )
        return Module(
            gameService: service,
            identifier: "Module1",
            title: "Easy algebra exercises 1",
            exercises: [exercise1, exercise2, exercise3]
        )
    }
    
    static func generateEasyMathModule2(for service: GameService) -> Module {
        let exercise1 = Exercise(
            question: "8 + 7 = ?",
            answers: [
                Answer(value: "12", correct: false),
                Answer(value: "15", correct: true),
                Answer(value: "16", correct: false),
                Answer(value: "17", correct: false),
                ]
        )
        let exercise2 = Exercise(
            question: "9 - ? = 5",
            answers: [
                Answer(value: "2", correct: false),
                Answer(value: "3", correct: false),
                Answer(value: "4", correct: true),
                Answer(value: "5", correct: false),
                ]
        )
        let exercise3 = Exercise(
            question: "21 / 3 = ?",
            answers: [
                Answer(value: "4", correct: false),
                Answer(value: "5", correct: false),
                Answer(value: "6", correct: false),
                Answer(value: "7", correct: true),
                ]
        )
        return Module(
            gameService: service,
            identifier: "Module2",
            title: "Easy algebra exercises 2",
            exercises: [exercise1, exercise2, exercise3]
        )
    }
}
