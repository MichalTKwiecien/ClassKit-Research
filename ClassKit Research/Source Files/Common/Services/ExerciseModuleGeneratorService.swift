//
//  ExerciseModuleGeneratorService.swift
//  ClassKit Research
//


final class ExerciseModuleGeneratorService {
    
    static func generateEasyMathModule() -> Module {
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
            title: "Easy algebra exercises",
            exercises: [exercise1, exercise2, exercise3]
        )
    }
}
