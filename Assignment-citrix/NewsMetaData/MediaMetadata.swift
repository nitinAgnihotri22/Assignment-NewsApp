//
//	MediaMetadata.swift
//
//	Create by Nitin Agnihotri on 2/7/2022
//	Copyright © 2022. All rights reserved.

import Foundation

struct MediaMetadata {

	var format : String!
	var height : Int!
	var url : String!
	var width : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		format = dictionary["format"] as? String
		height = dictionary["height"] as? Int
		url = dictionary["url"] as? String
		width = dictionary["width"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if format != nil{
			dictionary["format"] = format
		}
		if height != nil{
			dictionary["height"] = height
		}
		if url != nil{
			dictionary["url"] = url
		}
		if width != nil{
			dictionary["width"] = width
		}
		return dictionary
	}

}
