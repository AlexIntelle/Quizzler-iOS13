import Foundation

struct Quiz {
    
    let questions = [
        
        Question(text: "Four + Two is equal to Six", versions: nil, answer: "True"),
        Question(text: "Five - Three is greater than One", versions: nil, answer: "True"),
        Question(text: "Three + Eight is less than Ten", versions: nil, answer: "False"),
        Question(text: "One + Eight is less than Ten", versions: nil, answer: "True"),
        Question(text: "Three + Eight is equal to Ten", versions: nil, answer: "False"),
        Question(text: "Which of these colours is NOT featured in the logo for Google?", versions: ["Green", "Orange", "Blue"], answer: "Orange"),
        Question(text: "What do the letters in the GMT time zone stand for?", versions: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], answer: "Greenwich Mean Time"),
        Question(text: "Five dollars is worth how many nickels?", versions: ["25", "50", "100"], answer: "100"),
        Question(text: "What is the French word for 'hat'?", versions: ["Chapeau", "Écharpe", "Bonnet"], answer: "Chapeau")
        
    ]
    
    var questionNumber = 0
    var score = 0
    
    var currentQuestionText: String {
        questions[questionNumber].text
    }
    
    var progress: Float {
        Float(questionNumber) / Float(questions.count)
    }
    
    
    func check(_ answer: String) -> Bool {
        
        if answer == questions[questionNumber].answer {
            return true
        } else {
            return false
        }
    }
    
    
    mutating func nextQuestion() {
        
        if questionNumber + 1 < questions.count {
            questionNumber += 1
            
        } else {
            questionNumber = 0
        }
    }
    
    
    mutating func giveScore(for userAnswer: String) {
        
        if questionNumber + 1 == questions.count {
            score = 0
            return
        }
        
        if userAnswer == questions[questionNumber].answer {
            score += 1
        }
    }
    
    
    func questionType() -> String {
        
        let message: String
        if questions[questionNumber].versions == nil {
            message =  "no versions"
        } else {
            message = "versions"
        }
        return message 
    }
    
    
}
