//
//  gameVC.swift
//  hangman
//
//  Created by Rafael Plinio on 29/11/20.
//

import UIKit

class GameVC: UIViewController {

    var username: String!
    let wordList = ["Abnegation", "Aggrandize", "Alacrity", "Beguile", "Blandishment", "Callous", "Camaraderie",
                    "Cognizant", "Convivial", "Construe", "Demagogue", "Denigrate", "Didactic", "Disparate",
                    "Egregious", "Embezzlement", "Enervate", "Ephemeral", "Equanimity","Fatuous", "Gratuitous",
                    "Iconoclast", "Incumbent", "Inveterate","Idiosyncratic", "Quotidian", "Promulgate",
                    "Sanctimonious", "Recalcitrant", "Vociferous", "Vicissitude", "Solipsism", "Pertinacious",
                    "Obdurate", "Licentious", "Mendacious"]
    
    var hiddenWord: [Character] = []
    var pickedWord: [Character] = []
    var numberOfGuesses: Int = 6
    
    var timer = Timer()

    private lazy var hideContainer = UIView()
    
    private lazy var hangmanImage = UIImage(named: "hangman")
    private lazy var hangmanContainer = UIImageView()
    private lazy var hideHead = UIView()
    private lazy var hideLeftArm = UIView()
    private lazy var hideTorso = UIView()
    private lazy var hideRightArm = UIView()
    private lazy var hideLeftLeg = UIView()
    private lazy var hideRightLeg = UIView()
    private lazy var bodyParts = [hideHead, hideLeftArm, hideTorso, hideRightArm, hideRightLeg, hideLeftLeg]

    private lazy var alertContainer = HMAlertContainerView()
    private lazy var wordLabel = HMLabel()
    
    private lazy var firstButtonArrayStackView = UIStackView()
    private lazy var secondButtonArrayStackView = UIStackView()
    private lazy var thirdButtonArrayStackView = UIStackView()
    private lazy var fourthButtonArrayStackView = UIStackView()
    
    private lazy var buttonA = HMButton(backgroundColor: .systemBlue, title: "A")
    private lazy var buttonB = HMButton(backgroundColor: .systemBlue, title: "B")
    private lazy var buttonC = HMButton(backgroundColor: .systemBlue, title: "C")
    private lazy var buttonD = HMButton(backgroundColor: .systemBlue, title: "D")
    private lazy var buttonE = HMButton(backgroundColor: .systemBlue, title: "E")
    private lazy var buttonF = HMButton(backgroundColor: .systemBlue, title: "F")
    private lazy var buttonG = HMButton(backgroundColor: .systemBlue, title: "G")
    private lazy var buttonH = HMButton(backgroundColor: .systemBlue, title: "H")
    private lazy var buttonI = HMButton(backgroundColor: .systemBlue, title: "I")
    private lazy var buttonJ = HMButton(backgroundColor: .systemBlue, title: "J")
    private lazy var buttonK = HMButton(backgroundColor: .systemBlue, title: "K")
    private lazy var buttonL = HMButton(backgroundColor: .systemBlue, title: "L")
    private lazy var buttonM = HMButton(backgroundColor: .systemBlue, title: "M")
    private lazy var buttonN = HMButton(backgroundColor: .systemBlue, title: "N")
    private lazy var buttonO = HMButton(backgroundColor: .systemBlue, title: "O")
    private lazy var buttonP = HMButton(backgroundColor: .systemBlue, title: "P")
    private lazy var buttonQ = HMButton(backgroundColor: .systemBlue, title: "Q")
    private lazy var buttonR = HMButton(backgroundColor: .systemBlue, title: "R")
    private lazy var buttonS = HMButton(backgroundColor: .systemBlue, title: "S")
    private lazy var buttonT = HMButton(backgroundColor: .systemBlue, title: "T")
    private lazy var buttonU = HMButton(backgroundColor: .systemBlue, title: "U")
    private lazy var buttonV = HMButton(backgroundColor: .systemBlue, title: "V")
    private lazy var buttonX = HMButton(backgroundColor: .systemBlue, title: "W")
    private lazy var buttonW = HMButton(backgroundColor: .systemBlue, title: "X")
    private lazy var buttonY = HMButton(backgroundColor: .systemBlue, title: "Y")
    private lazy var buttonZ = HMButton(backgroundColor: .systemBlue, title: "Z")
    
    var buttonsArray: [HMButton?] {
        [buttonA, buttonB, buttonC, buttonD, buttonE, buttonF, buttonG,
         buttonH, buttonI, buttonJ, buttonK, buttonL, buttonM, buttonN,
         buttonO, buttonP, buttonQ, buttonR, buttonS, buttonT, buttonU,
         buttonV, buttonW, buttonX, buttonY, buttonZ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        title = "GAME"
        navigationController?.isNavigationBarHidden = false
        
        setupFourthRowButtonStackView()
        setupThirdRowButtonStackView()
        setupSecondRowButtonStackView()
        setupFirstRowButtonStackView()
        setupWordLabel()
        setupHangmanContainer()
        pickupRandomWord()
        detectButtonPressed()
        
    }

    
//MARK: - Logic
    
    func pickupRandomWord() {
        
        pickedWord = Array(wordList.randomElement()?.uppercased() ?? "")
        
        for _ in pickedWord {
            hiddenWord.append("_")
        }
    
        wordLabel.text = String(hiddenWord)
        wordLabel.setCharacterSpacing(3)
    }
    
    func showWinAlert() {
        presentHMAlertOnMainThread(container: alertContainer,
                                   title: "You Got It! 🤓",
                                   message: "Congratulations! The word you guessed was: \(String(pickedWord)).",
                                   buttonTitle: "Ok")
        resetGame()
    }
    
    func showLoseAlert() {
        presentHMAlertOnMainThread(container: alertContainer,
                                   title: "You Didn't Get It! 😖",
                                   message: "Better luck next time if you come across this same word in the future 😄",
                                   buttonTitle: "Ok")
        resetGame()
    }
    
    func checkIfWon() {
        if (wordLabel.text != String(pickedWord)) {
            if numberOfGuesses <= 0 {
                wordLabel.backgroundColor = .systemRed
                wordLabel.textColor = .white

                loseAlertTimer()
            }
        } else {
            wordLabel.backgroundColor = .systemGreen
            wordLabel.textColor = .systemGray6

            winAlertTimer()
        }
    }
    
    func resetGame() {
        
        numberOfGuesses = 6
        
        pickedWord.removeAll()
        hiddenWord.removeAll()
        
        wordLabel.text?.removeAll()
        wordLabel.backgroundColor = .white
        wordLabel.textColor = .black
        
        pickupRandomWord()

        for button in buttonsArray {
            button?.isEnabled = true
            button?.backgroundColor = .systemBlue
        }

        for bodyPart in bodyParts {
            bodyPart.backgroundColor = .systemGray6
        }
    }
    
    
//MARK: - Timer
    
    func winAlertTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(winTimerAction), userInfo: nil, repeats: false)
    }
    
    @objc func winTimerAction() {
        showWinAlert()
    }
    
    func loseAlertTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(loseTimerAction), userInfo: nil, repeats: false)
    }
    
    @objc func loseTimerAction() {
        showLoseAlert()
    }
    
    
//MARK: - Button Actions
    func detectButtonPressed() {
        buttonA.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonB.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonC.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonD.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonE.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonF.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonG.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonH.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonI.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonJ.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonK.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonL.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonM.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonN.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonO.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonP.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonQ.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonR.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonS.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonT.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonU.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonV.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonW.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonX.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonY.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonZ.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

    }
    
    @objc func buttonPressed(_ sender: UIButton) {

        if let letterPressed = sender.titleLabel?.text {
            for (i, char) in pickedWord.enumerated() {
                if char == Character(letterPressed) {
                    hiddenWord[i] = Character(letterPressed)
                }
            }
            
            if pickedWord.contains(Character(letterPressed)) {
                sender.backgroundColor = .systemGreen
                sender.alpha = 0.9
                sender.isEnabled = false
                
            } else {
                sender.backgroundColor = .systemRed
                sender.alpha = 0.9
                sender.isEnabled = false

                numberOfGuesses -= 1

                if numberOfGuesses == 5 {
                    hideHead.backgroundColor = .clear
                } else if numberOfGuesses == 4 {
                    hideTorso.backgroundColor = .clear

                } else if numberOfGuesses == 3 {
                    hideLeftArm.backgroundColor = .clear

                } else if numberOfGuesses == 2 {
                    hideRightArm.backgroundColor = .clear

                } else if numberOfGuesses == 1 {
                    hideLeftLeg.backgroundColor = .clear

                } else {
                    hideLeftLeg.backgroundColor = .clear

                }
            }
            
            wordLabel.text = String(hiddenWord)
            checkIfWon()
        }
    }
}


//MARK: - UI
extension GameVC {
    
    func setupHangmanContainer() {
        view.addSubview(hangmanContainer)
        hangmanContainer.addSubview(hideHead)
        hangmanContainer.addSubview(hideTorso)
        hangmanContainer.addSubview(hideLeftArm)
        hangmanContainer.addSubview(hideRightArm)
        hangmanContainer.addSubview(hideLeftLeg)
        hangmanContainer.addSubview(hideRightLeg)

        hangmanContainer.image = hangmanImage

        hangmanContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hangmanContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            hangmanContainer.heightAnchor.constraint(equalToConstant: 300),
            hangmanContainer.widthAnchor.constraint(equalToConstant: 300),
            hangmanContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])

        hideHead.backgroundColor = .systemGray6
        hideHead.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hideHead.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 88),
            hideHead.heightAnchor.constraint(equalToConstant: 60),
            hideHead.widthAnchor.constraint(equalToConstant: 80),
            hideHead.leadingAnchor.constraint(equalTo: hangmanContainer.leadingAnchor, constant: 20)
        ])

        hideTorso.backgroundColor = .systemGray6
        hideTorso.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hideTorso.topAnchor.constraint(equalTo: hideHead.bottomAnchor, constant: 0),
            hideTorso.heightAnchor.constraint(equalToConstant: 80),
            hideTorso.widthAnchor.constraint(equalToConstant: 40),
            hideTorso.leadingAnchor.constraint(equalTo: hangmanContainer.leadingAnchor, constant: 48)
        ])

        hideLeftArm.backgroundColor = .systemGray6
        hideLeftArm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hideLeftArm.topAnchor.constraint(equalTo: hideTorso.topAnchor, constant: 0),
            hideLeftArm.heightAnchor.constraint(equalToConstant: 75),
            hideLeftArm.widthAnchor.constraint(equalToConstant: 30),
            hideLeftArm.leadingAnchor.constraint(equalTo: hideHead.leadingAnchor, constant: 0)
        ])

        hideRightArm.backgroundColor = .systemGray6
        hideRightArm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hideRightArm.topAnchor.constraint(equalTo: hideTorso.topAnchor, constant: 0),
            hideRightArm.heightAnchor.constraint(equalToConstant: 75),
            hideRightArm.widthAnchor.constraint(equalToConstant: 30),
            hideRightArm.leadingAnchor.constraint(equalTo: hideTorso.trailingAnchor, constant: 0)
        ])

        hideLeftLeg.backgroundColor = .systemGray6
        hideLeftLeg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hideLeftLeg.topAnchor.constraint(equalTo: hideTorso.bottomAnchor, constant: 0),
            hideLeftLeg.heightAnchor.constraint(equalToConstant: 75),
            hideLeftLeg.widthAnchor.constraint(equalToConstant: 30),
            hideLeftLeg.trailingAnchor.constraint(equalTo: hideTorso.centerXAnchor, constant: 0)
        ])

        hideRightLeg.backgroundColor = .systemGray6
        hideRightLeg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hideRightLeg.topAnchor.constraint(equalTo: hideTorso.bottomAnchor, constant: 0),
            hideRightLeg.heightAnchor.constraint(equalToConstant: 75),
            hideRightLeg.widthAnchor.constraint(equalToConstant: 30),
            hideRightLeg.leadingAnchor.constraint(equalTo: hideTorso.centerXAnchor, constant: 0)
        ])
    }
 


    
    func setupWordLabel() {
        view.addSubview(wordLabel)
        
        wordLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        wordLabel.font = UIFont(name: "Chalkboard SE", size: 32)
        wordLabel.minimumScaleFactor = 0.60
        wordLabel.layer.cornerRadius = 10
        wordLabel.layer.borderWidth = 2
        wordLabel.layer.borderColor = UIColor.systemGray4.cgColor
        wordLabel.layer.masksToBounds = true
        
        
        wordLabel.backgroundColor = .white
        wordLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            wordLabel.bottomAnchor.constraint(equalTo: firstButtonArrayStackView.topAnchor, constant: -8),
            wordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            wordLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])

    }
    
    func setupFirstRowButtonStackView() {
        view.addSubview(firstButtonArrayStackView)
          
        firstButtonArrayStackView.axis = .horizontal
        firstButtonArrayStackView.distribution = .fillEqually
        firstButtonArrayStackView.alignment = .fill
        firstButtonArrayStackView.spacing = 5
        
        firstButtonArrayStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstButtonArrayStackView.bottomAnchor.constraint(equalTo: secondButtonArrayStackView.topAnchor, constant: -4),
            firstButtonArrayStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            firstButtonArrayStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
        
        firstButtonArrayStackView.addArrangedSubview(buttonA)
        firstButtonArrayStackView.addArrangedSubview(buttonB)
        firstButtonArrayStackView.addArrangedSubview(buttonC)
        firstButtonArrayStackView.addArrangedSubview(buttonD)
        firstButtonArrayStackView.addArrangedSubview(buttonE)
        firstButtonArrayStackView.addArrangedSubview(buttonF)
        firstButtonArrayStackView.addArrangedSubview(buttonG)
    }
    
    func setupSecondRowButtonStackView() {
        view.addSubview(secondButtonArrayStackView)
          
        secondButtonArrayStackView.axis = .horizontal
        secondButtonArrayStackView.distribution = .fillEqually
        secondButtonArrayStackView.alignment = .fill
        secondButtonArrayStackView.spacing = 5
        
        secondButtonArrayStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondButtonArrayStackView.bottomAnchor.constraint(equalTo: thirdButtonArrayStackView.topAnchor, constant: -4),
            secondButtonArrayStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            secondButtonArrayStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
        
        secondButtonArrayStackView.addArrangedSubview(buttonH)
        secondButtonArrayStackView.addArrangedSubview(buttonI)
        secondButtonArrayStackView.addArrangedSubview(buttonJ)
        secondButtonArrayStackView.addArrangedSubview(buttonK)
        secondButtonArrayStackView.addArrangedSubview(buttonL)
        secondButtonArrayStackView.addArrangedSubview(buttonM)
        secondButtonArrayStackView.addArrangedSubview(buttonN)
    }
    
    func setupThirdRowButtonStackView() {
        view.addSubview(thirdButtonArrayStackView)
          
        thirdButtonArrayStackView.axis = .horizontal
        thirdButtonArrayStackView.distribution = .fillEqually
        thirdButtonArrayStackView.alignment = .fill
        thirdButtonArrayStackView.spacing = 5
        
        thirdButtonArrayStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdButtonArrayStackView.bottomAnchor.constraint(equalTo: fourthButtonArrayStackView.topAnchor, constant: -4),
            thirdButtonArrayStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            thirdButtonArrayStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        thirdButtonArrayStackView.addArrangedSubview(buttonO)
        thirdButtonArrayStackView.addArrangedSubview(buttonP)
        thirdButtonArrayStackView.addArrangedSubview(buttonQ)
        thirdButtonArrayStackView.addArrangedSubview(buttonR)
        thirdButtonArrayStackView.addArrangedSubview(buttonS)
        thirdButtonArrayStackView.addArrangedSubview(buttonT)
        thirdButtonArrayStackView.addArrangedSubview(buttonU)
    }
    
    func setupFourthRowButtonStackView() {
        view.addSubview(fourthButtonArrayStackView)
          
        fourthButtonArrayStackView.axis = .horizontal
        fourthButtonArrayStackView.distribution = .fillEqually
        fourthButtonArrayStackView.alignment = .fill
        fourthButtonArrayStackView.spacing = 5
        
        fourthButtonArrayStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fourthButtonArrayStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            fourthButtonArrayStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            fourthButtonArrayStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -64)
            
        ])
        
        fourthButtonArrayStackView.addArrangedSubview(buttonV)
        fourthButtonArrayStackView.addArrangedSubview(buttonX)
        fourthButtonArrayStackView.addArrangedSubview(buttonW)
        fourthButtonArrayStackView.addArrangedSubview(buttonY)
        fourthButtonArrayStackView.addArrangedSubview(buttonZ)
                
    }
}


//extension
extension UILabel {
    func setCharacterSpacing(_ spacing: CGFloat){
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
        
        self.attributedText = attributedStr
     }
}


