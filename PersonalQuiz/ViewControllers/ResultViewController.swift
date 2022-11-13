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
        let resultAnimals = answersChosen.compactMap({ $0.animal })
        print(resultAnimals)
        
        let resultDog = resultAnimals.filter({ $0 == PersonalQuiz.Animal.dog }).count
        print(resultDog)
        
        let resultCat = resultAnimals.filter({ $0 == PersonalQuiz.Animal.cat }).count
        print(resultCat)
        
        let resultRabbit = resultAnimals.filter({ $0 == PersonalQuiz.Animal.rabbit }).count
        print(resultRabbit)
        
        let resultTurtle = resultAnimals.filter({ $0 == PersonalQuiz.Animal.turtle }).count
        print(resultTurtle)
        
        //dog = "🐶"
        //cat = "🐱"
        //rabbit = "🐰"
        //turtle = "🐢"
        
        // 4. Отобразить результаты в соответствии с этим животным
        quizResultLabel.text = "Вы - 🪲!"
        quizResultDescriptionLabel.text = "Да, вы жук!"
    }
    

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit{
        print("ResultVC has been delocated")
    }
    
}
