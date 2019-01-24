//
//  Post.swift
//  NetworkLab
//
//  Created by Greg Alton on 1/23/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import Foundation

struct Post: Encodable, Decodable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
