//
//  ViewController.swift
//  HigherOrderFunctions
//
//  Created by Raj Rathod on 25/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mapDemo()
        self.flatMapDemo()
        self.compactMapDemo()
        self.filterDemo()
        self.reduceDemo()
    }

    // MARK: The map function works by performing an operation on all the elements of a collection and returning a new collection with the results of that operation.
    
  //  For example, let’s suppose that we have an array with several words with all their letters in lowercase and we want to obtain a new array with each of these words but with all the uppercase letters. We could do this with a for…in loop:
    func mapDemo() {
        // Use Case 1
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        var uppercasedWords: [String] = [String]()
        for word in words {
            uppercasedWords.append(word.uppercased())
        }
        print("map Use Case 1", uppercasedWords)

        // Use Case 2
        let uppercasedWords2 = words.map({ word in
            return word.uppercased()
        })
        print("map Use Case 2", uppercasedWords2)
        
        // Use Case 3
        let uppercasedWords3 = words.map({ $0.uppercased() })
        print("map Use Case 3", uppercasedWords3)

    }
    
    // MARK: The flatMap function allows us to transform a set of arrays into a single set that contains all the elements.
    func flatMapDemo() {
        let words: [[String]] = [["room", "home"], ["train", "green"], ["heroe"]]
        let singleArray = words.flatMap { $0 }
        print("FlatMap ", singleArray)
    }
    
    // MARK: Now suppose that inside the array of the previous example there are nil values. If we use the map function, we must take into account whether the value to be acted on is nil or not:
    func compactMapDemo() {
        let words = ["room", nil, nil, "home", "train", "green", "heroe"]
        let uppercasedWords = words.compactMap {$0?.uppercased() }
        print("compactMap Use Case 1", uppercasedWords)

    }
    
    // MARK: As its name suggests, the filter function filters the content of a collection and returns a new collection that contains the elements that meet a certain condition:
    func filterDemo() {
        // Use Case 1
        let words: [String] = ["room", "home", "train", "green", "heroe"]
        let wordsWithO = words.filter { $0.contains("o") }
        print("Filter Use case 1", wordsWithO)
        
        // Use Case 2
        let wordsWithO2 = words.filter { $0.contains("o") && $0.count >= 5 }
        print("Filter Use case 2", wordsWithO2)
    }
    
    // MARK: reduce is a function that, when applied to a collection, returns the result of combining the elements of that collection
    func reduceDemo() {
        // Use Case 2
        let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
         
        let sum = numbers.reduce(0, { x, y in
            return x + y
        })
         print("Reduce Use case 1", sum)
        
        // Use Case 2
        let sum2 = numbers.reduce(0, { $0 + $1 })
        print("Reduce Use case 2", sum2)

        // Use Case 3
        let sum3 = numbers.reduce(0, +)
        print("Reduce Use case 3", sum3)
    }
}

