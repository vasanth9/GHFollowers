//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by vasanth kumar cheepurupalli on 03/01/24.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created a invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data recieved from the server was invalid. Please try again."
}
