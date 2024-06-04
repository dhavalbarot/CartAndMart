//
//  ContentModel.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import Foundation

// MARK: - ContentModel
/**
 A model representing content with an optional image name, title, and message.

 - Properties:
   - imageName: Optional name of the image associated with the content.
   - title: The title of the content.
   - message: The main message or body of the content.
 */
struct ContentModel {
  var imageName: String? = nil
  let title: String
  let message: String
}
