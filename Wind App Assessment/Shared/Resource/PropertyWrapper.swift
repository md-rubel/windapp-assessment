//
//  PropertyWrapper.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import Foundation

@discardableResult
func with<T: AnyObject>(_ obj: T, task: (T)->Void) -> T {
  task(obj)
  return obj
}


