//
//	Result.swift
//
//	Create by Nitin Agnihotri on 2/7/2022
//	Copyright © 2022. All rights reserved.

import Foundation

struct Result{

	var abstractField : String!
	var adxKeywords : String!
	var assetId : Int!
	var byline : String!
	var column : AnyObject!
	var desFacet : [String]!
	var etaId : Int!
	var geoFacet : [String]!
	var id : Int!
	var media : [Media]!
	var nytdsection : String!
	var orgFacet : [String]!
	var perFacet : [AnyObject]!
	var publishedDate : String!
	var section : String!
	var source : String!
	var subsection : String!
	var title : String!
	var type : String!
	var updated : String!
	var uri : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		abstractField = dictionary["abstract"] as? String
		adxKeywords = dictionary["adx_keywords"] as? String
		assetId = dictionary["asset_id"] as? Int
		byline = dictionary["byline"] as? String
		column = dictionary["column"] as? AnyObject
		desFacet = dictionary["des_facet"] as? [String]
		etaId = dictionary["eta_id"] as? Int
		geoFacet = dictionary["geo_facet"] as? [String]
		id = dictionary["id"] as? Int
		media = [Media]()
		if let mediaArray = dictionary["media"] as? [NSDictionary]{
			for dic in mediaArray{
				let value = Media(fromDictionary: dic)
				media.append(value)
			}
		}
		nytdsection = dictionary["nytdsection"] as? String
		orgFacet = dictionary["org_facet"] as? [String]
		perFacet = dictionary["per_facet"] as? [AnyObject]
		publishedDate = dictionary["published_date"] as? String
		section = dictionary["section"] as? String
		source = dictionary["source"] as? String
		subsection = dictionary["subsection"] as? String
		title = dictionary["title"] as? String
		type = dictionary["type"] as? String
		updated = dictionary["updated"] as? String
		uri = dictionary["uri"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if abstractField != nil{
			dictionary["abstract"] = abstractField
		}
		if adxKeywords != nil{
			dictionary["adx_keywords"] = adxKeywords
		}
		if assetId != nil{
			dictionary["asset_id"] = assetId
		}
		if byline != nil{
			dictionary["byline"] = byline
		}
		if column != nil{
			dictionary["column"] = column
		}
		if desFacet != nil{
			dictionary["des_facet"] = desFacet
		}
		if etaId != nil{
			dictionary["eta_id"] = etaId
		}
		if geoFacet != nil{
			dictionary["geo_facet"] = geoFacet
		}
		if id != nil{
			dictionary["id"] = id
		}
		if media != nil{
			var dictionaryElements = [NSDictionary]()
			for mediaElement in media {
				dictionaryElements.append(mediaElement.toDictionary())
			}
			dictionary["media"] = dictionaryElements
		}
		if nytdsection != nil{
			dictionary["nytdsection"] = nytdsection
		}
		if orgFacet != nil{
			dictionary["org_facet"] = orgFacet
		}
		if perFacet != nil{
			dictionary["per_facet"] = perFacet
		}
		if publishedDate != nil{
			dictionary["published_date"] = publishedDate
		}
		if section != nil{
			dictionary["section"] = section
		}
		if source != nil{
			dictionary["source"] = source
		}
		if subsection != nil{
			dictionary["subsection"] = subsection
		}
		if title != nil{
			dictionary["title"] = title
		}
		if type != nil{
			dictionary["type"] = type
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		if uri != nil{
			dictionary["uri"] = uri
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}
