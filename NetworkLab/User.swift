//
//  User.swift
//  NetworkLab
//
//  Created by Greg Alton on 1/25/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import Foundation

struct User: Decodable{
    let id: Int
    let name: String
    let email: String
    let phone: String
    let company: [String : String]
    let username: String
    let website: String
}
