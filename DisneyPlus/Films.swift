//
//  Films.swift
//  DisneyPlus
//
//  Created by Kaan Uzun on 15.05.2024.
//

import Foundation

struct Films {
  var id:Int?
  var name:String?
  var image:String?


  init(id: Int?, name: String?, image: String?) {
    self.id = id
    self.name = name
    self.image = image
  }
}

