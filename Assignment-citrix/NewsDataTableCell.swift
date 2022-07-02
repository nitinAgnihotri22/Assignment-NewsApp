//
//  NewsDataTableCell.swift
//  Assignment-citrix
//
//  Created by Nitin Agnihotri on 02/07/22.
//

import UIKit

class NewsDataTableCell: UITableViewCell {

    @IBOutlet var newsArticalImgView: UIImageView!
    @IBOutlet var newsTitleLbl: UILabel!
    @IBOutlet var newsAbstractLbl: UILabel!
    @IBOutlet var newsAuthorLbl: UILabel!
    @IBOutlet var newsDateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(_ data:NewsData,index:Int) {
        newsArticalImgView.imageFromServerURL(getArticalImgUrl(data, index), placeHolder: nil,contMode: .scaleAspectFit)
        newsTitleLbl.text = data.results[index].title
        newsAbstractLbl.text = data.results[index].abstractField
        newsAuthorLbl.text = data.results[index].byline
        newsDateLbl.text = data.results[index].updated
    }
    
    private func getArticalImgUrl(_ data:NewsData,_ index:Int) -> String {
        
        guard let str = data.results[index].media[0].mediametadata[0].url else {
            return ""
        }
        
        return str
    }
}
