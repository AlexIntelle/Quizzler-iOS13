import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var thirdButtonLabel: UIButton!
    @IBOutlet weak var trueButtonLabel: UIButton!
    @IBOutlet weak var falseButtonLabel: UIButton!
    @IBOutlet weak var progressViewLabel: UIProgressView!
    
    var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else {return}
        let result = quiz.check(userAnswer)
        
        if result {
            sender.backgroundColor = UIColor.green
            
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quiz.giveScore(for: userAnswer)
        quiz.nextQuestion()
        updateUI()
        
    }
    
    
    func updateUI() {
        
        UIView.animate(withDuration: 1.0) {
            self.falseButtonLabel.backgroundColor = UIColor.clear
            self.trueButtonLabel.backgroundColor = UIColor.clear
            self.thirdButtonLabel.backgroundColor = UIColor.clear
        }
        
        questionLabel.text = quiz.currentQuestionText
        progressViewLabel.progress = quiz.progress
        scoreLabel.text = "Score: \(quiz.score)"
        
        let questionType = quiz.questionType()
        
        if questionType == "no versions"{
            
            thirdButtonLabel.isHidden = true
            
            trueButtonLabel.setTitle("True", for: .normal)
            falseButtonLabel.setTitle("False", for: .normal)
            
        } else if questionType == "versions" {
            
            thirdButtonLabel.isHidden = false
            
            let questionNumber = quiz.questionNumber
            thirdButtonLabel.setTitle(quiz.questions[questionNumber].versions?[0], for: .normal)
            trueButtonLabel.setTitle(quiz.questions[questionNumber].versions?[1], for: .normal)
            falseButtonLabel.setTitle(quiz.questions[questionNumber].versions?[2], for: .normal)
        }
        
    }
    
}


