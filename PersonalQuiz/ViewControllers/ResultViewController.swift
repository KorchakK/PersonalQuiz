//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    private let animalsAvailable: [Animal] = Animal.allCases
    private var animalsChosen: [Animal] {
        answersChosen.map { $0.animal }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultLabel.text = "Вы - \(searchGeneralAnimal().rawValue)"
        descriptionLabel.text = searchGeneralAnimal().definition
    }
}

// MARK: - Private func
extension ResultViewController {
    private func searchGeneralAnimal() -> Animal {
        let sortedCounterOfAnimals = countOfChoosesAnimals().sorted { $0.1 < $1.1 }
        guard let generalAnimal = sortedCounterOfAnimals.last?.0 else { return Animal.dog }
        return generalAnimal
    }
    
    private func countOfChoosesAnimals() -> [(Animal, Int)] {
        var counter: [(Animal, Int)] = []
        for animal in animalsAvailable {
            var count: (Animal, Int)
            count.0 = animal
            count.1 = animalsChosen.filter { $0 == animal }.count
            counter.append(count)
        }
        return counter
    }
}
