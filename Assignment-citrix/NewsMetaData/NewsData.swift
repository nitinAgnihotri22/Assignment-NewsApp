//
//	NewsData.swift
//
//	Create by Nitin Agnihotri on 2/7/2022
//	Copyright © 2022. All rights reserved.

import Foundation

struct NewsData {

	var copyright : String!
	var numResults : Int!
	var results : [Result]!
	var status : String!
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		copyright = dictionary["copyright"] as? String
		numResults = dictionary["num_results"] as? Int
		results = [Result]()
		if let resultsArray = dictionary["results"] as? [NSDictionary]{
			for dic in resultsArray{
				let value = Result(fromDictionary: dic)
				results.append(value)
			}
		}
		status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if copyright != nil{
			dictionary["copyright"] = copyright
		}
		if numResults != nil{
			dictionary["num_results"] = numResults
		}
		if results != nil{
			var dictionaryElements = [NSDictionary]()
			for resultsElement in results {
				dictionaryElements.append(resultsElement.toDictionary())
			}
			dictionary["results"] = dictionaryElements
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

}
