//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var quizResultLabel: UILabel!
    @IBOutlet weak var quizResultDescriptionLabel: UILabel!
    
    // MARK: - Properties
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Избавиться от кнопки возврата назад на экране результатов
        navigationItem.setHidesBackButton(true, animated: true)
        
        // 2. Передать массив с ответами на экран с результатами
        // for answer in answersChosen {
        //    print(answer)
        // }
        
        // 3. Определить наиболее часто встречающийся тип животного
        // использовать функции высшего порядка map и sorted
        // отдельный метод для поиска результата
        let resultAnimal = getResultAnimal()
        
        // 4. Отобразить результаты в соответствии с этим животным
        quizResultLabel.text = "Вы - \(resultAnimal.resultAnimalValue)!"
        quizResultDescriptionLabel.text = "Да, вы \(resultAnimal.resultAnimalKey)!"
    }
    

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit{
        print("ResultVC has been delocated")
    }
    
}

// MARK: - Private Methods
extension ResultViewController {
   
    private func getResultAnimal() -> (resultAnimalKey: String, resultAnimalValue: String) {
        let resultAnimals = answersChosen.compactMap({ $0.animal })
        //print(resultAnimals)
        
        let resultDog = resultAnimals.filter({ $0 == PersonalQuiz.Animal.dog }).count
        //print(resultDog)
        
        let resultCat = resultAnimals.filter({ $0 == PersonalQuiz.Animal.cat }).count
        //print(resultCat)
        
        let resultRabbit = resultAnimals.filter({ $0 == PersonalQuiz.Animal.rabbit }).count
        //print(resultRabbit)
        
        let resultTurtle = resultAnimals.filter({ $0 == PersonalQuiz.Animal.turtle }).count
        //print(resultTurtle)
        
        let quantityResultAnimals = ["Собака": resultDog, "Кот": resultCat, "Кролик": resultRabbit, "Черепаха": resultTurtle]
        
        let quantityResultAnimalsSorted = quantityResultAnimals.sorted(by: { $0.value < $1.value })
        //print(quantityResultAnimals)
        //print(quantityResultAnimals.first?.key)
        
        let resultAnimalKey = quantityResultAnimalsSorted.first!.key
        var resultAnimalValue = "";
        
        if resultAnimalKey == "Собака" {
            resultAnimalValue = "🐶"
        } else if resultAnimalKey == "Кот" {
            resultAnimalValue = "🐱"
        } else if resultAnimalKey == "Кролик" {
            resultAnimalValue = "🐰"
        } else if resultAnimalKey == "Черепаха" {
            resultAnimalValue = "🐢"
        }
        
        return (resultAnimalKey, resultAnimalValue)
        
    }
    
}
