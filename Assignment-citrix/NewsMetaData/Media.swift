//
//	Media.swift
//
//	Create by Nitin Agnihotri on 2/7/2022
//	Copyright © 2022. All rights reserved.

import Foundation

struct Media{

	var approvedForSyndication : Int!
	var caption : String!
	var copyright : String!
	var mediametadata : [MediaMetadata]!
	var subtype : String!
	var type : String!
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		approvedForSyndication = dictionary["approved_for_syndication"] as? Int
		caption = dictionary["caption"] as? String
		copyright = dictionary["copyright"] as? String
		mediametadata = [MediaMetadata]()
		if let mediametadataArray = dictionary["media-metadata"] as? [NSDictionary]{
			for dic in mediametadataArray{
				let value = MediaMetadata(fromDictionary: dic)
				mediametadata.append(value)
			}
		}
		subtype = dictionary["subtype"] as? String
		type = dictionary["type"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if approvedForSyndication != nil{
			dictionary["approved_for_syndication"] = approvedForSyndication
		}
		if caption != nil{
			dictionary["caption"] = caption
		}
		if copyright != nil{
			dictionary["copyright"] = copyright
		}
		if mediametadata != nil{
			var dictionaryElements = [NSDictionary]()
			for mediametadataElement in mediametadata {
				dictionaryElements.append(mediametadataElement.toDictionary())
			}
			dictionary["media-metadata"] = dictionaryElements
		}
		if subtype != nil{
			dictionary["subtype"] = subtype
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}

}
