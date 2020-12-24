//
//  gameVC.swift
//  hangman
//
//  Created by Rafael Plinio on 29/11/20.
//

import UIKit

class GameVC: UIViewController {

    var username: String!
    
    private lazy var firstButtonArrayStackView = UIStackView()
    private lazy var secondButtonArrayStackView = UIStackView()
    private lazy var thirdButtonArrayStackView = UIStackView()
    private lazy var fourthButtonArrayStackView = UIStackView()
    private lazy var wordLabel = HMLabel()
    
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
        [self.buttonA, self.buttonB, self.buttonC, self.buttonD, self.buttonE, self.buttonF, self.buttonG,
         self.buttonH, self.buttonI, self.buttonJ, self.buttonK, self.buttonL, self.buttonM, self.buttonN,
         self.buttonO, self.buttonP, self.buttonQ, self.buttonR, self.buttonS, self.buttonT, self.buttonU,
         self.buttonV, self.buttonW, self.buttonX, self.buttonY, self.buttonZ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        title = "GAME"
        navigationController?.isNavigationBarHidden = false
        
        setupFourthRowButtonStackView()
        setupThirdRowButtonStackView()
        setupSecondRowButtonStackView()
        setupFirstRowButtonStackView()
        setupWordLabel()
        pickupRandomWord()
//        addTagsToButtons()
        detectButtonPressed()
        
    }
    
    
//MARK: - Logic
    
    let wordList = ["pineapple", "banana", "fig"]
    var hiddenWord: [Character] = []
    var pickedWord: [Character] = []
    
    
    func pickupRandomWord() {
        
        pickedWord = Array(wordList.randomElement()?.uppercased() ?? "")
        
        for _ in pickedWord {
            hiddenWord.append("_")
        }
    
        wordLabel.text = String(hiddenWord)
        wordLabel.setCharacterSpacing(5)
        
        print("hiddenWord [character]:  \(hiddenWord)")
        print("pickedWord [character]:  \(pickedWord)")
        
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
    
    var temporaryWord: [Character] = []
    
    @objc func buttonPressed(_ sender: UIButton) {
        if let letterPressed = sender.titleLabel?.text {
            print(sender.titleLabel?.text)
            
            for (i, char) in pickedWord.enumerated() {
                if char == Character(letterPressed) {
                    hiddenWord[i] = Character(letterPressed)
                    
                }
                
                if pickedWord.contains(Character(letterPressed)) {
                    sender.backgroundColor = .systemGreen
                } else {
                    sender.backgroundColor = .systemRed
                    sender.alpha = 0.8
                    sender.isEnabled = false
                }
            }
            
            wordLabel.text = String(hiddenWord)

        }
    }
}


//MARK: - UI
extension GameVC {
    func setupWordLabel() {
        view.addSubview(wordLabel)
        
        wordLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        wordLabel.font = UIFont(name: "Chalkboard SE", size: 30)
        wordLabel.layer.cornerRadius = 10
        wordLabel.layer.borderWidth = 2
        wordLabel.layer.borderColor = UIColor.systemBackground.cgColor
        wordLabel.layer.masksToBounds = true
        
        
        wordLabel.backgroundColor = .systemGray4
        wordLabel.textColor = .systemPurple
        
        NSLayoutConstraint.activate([
            wordLabel.bottomAnchor.constraint(equalTo: firstButtonArrayStackView.topAnchor, constant: -16),
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
            firstButtonArrayStackView.bottomAnchor.constraint(equalTo: secondButtonArrayStackView.topAnchor, constant: -10),
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
            secondButtonArrayStackView.bottomAnchor.constraint(equalTo: thirdButtonArrayStackView.topAnchor, constant: -10),
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
            thirdButtonArrayStackView.bottomAnchor.constraint(equalTo: fourthButtonArrayStackView.topAnchor, constant: -10),
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
            fourthButtonArrayStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
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
