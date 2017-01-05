//
//  ViewController.swift
//  AZSearchViewController
//
//  Created by Antonio Zaitoun on 04/01/2017.
//  Copyright © 2017 Antonio Zaitoun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var resultArray:[String] = []
    
    var searchController:AZSearchViewController!
    
    
    @IBAction func click(_ sender: UIButton) {
        self.present(searchController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = AZSearchViewController()
        self.searchController.delegate = self
        self.searchController.dataSource = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: AZSearchViewDelegate{
    
    func didSearch(forText text: String) {
        searchController.dismiss(animated: false, completion: nil)
    }
    
    func didTextChange(toText text: String, textLength: Int) {
        print(text)
        self.resultArray.removeAll()
        
        if textLength > 3 {
            for i in 0..<arc4random_uniform(10)+1 {self.resultArray.append("\(text) \(i+1)")}
        }
        
        self.searchController.reloadData()
    }
    
    func didSelectResult(at index: Int, text: String) {
        print("selected \(index)")
        self.searchController.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: AZSearchViewDataSource{
    
    func results() -> [String] {
        return self.resultArray
    }
    
}

