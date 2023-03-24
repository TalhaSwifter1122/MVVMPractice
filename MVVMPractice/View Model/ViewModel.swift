//
//  ModelView.swift
//  MVVMPractice
//
//  Created by Mohammad  Talha on 21/03/2023.
//

import Foundation
import RxCocoa
import RxSwift
import SwiftyJSON

class ModelView {
    
   
    let category = BehaviorRelay<[UsersData]>(value: [])
    let sessionName = BehaviorRelay<String>(value: "")
    let labelName = BehaviorRelay<String>(value: "")
    
    func fetchMovieData(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else{
                return
            }
            do{
                let responseData  = try JSONDecoder().decode([UsersData].self, from: data)
                // --- Emit the elements Data is recieved -----
                
                self.category.accept(responseData)
              
                self.labelName.accept(responseData[0].title)
                
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    

}
