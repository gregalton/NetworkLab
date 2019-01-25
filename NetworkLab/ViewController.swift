//
//  ViewController.swift
//  NetworkLab
//
//  Created by Greg Alton on 1/23/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func getButton(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                //let user = try JSONSerialization.jsonObject(with: data, options: [])
                let users = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.resultLabel.text = "\(users)"
                }
            } catch {
                
            }
        }
        task.resume()
    }
    
    @IBAction func postButton(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let post = Post(id: 1, userId: 1, title: "Hi Tim", body: "Do you have time to meet?")
        
        do {
            //let jsonData = try JSONSerialization.data(withJSONObject: post, options: [])
            let json = try JSONEncoder().encode(post)
            request.httpBody = json
        } catch {
            self.resultLabel.text = "Error: \(error)"
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, _, _) in
            guard let data = data else {return}
            do {
                //let json = try JSONSerialization.jsonObject(with: data, options: [])
                let decodedJson = try JSONDecoder().decode(Post.self, from: data)
                DispatchQueue.main.async {
                    //self.resultLabel.text?.append(\n)
                    self.resultLabel.text?.append("\(decodedJson)")
                }
            } catch {
                
            }
        }
        task.resume()
    }


}

