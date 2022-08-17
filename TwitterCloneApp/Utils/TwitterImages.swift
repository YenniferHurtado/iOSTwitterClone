//
//  TwitterImages.swift
//  TwitterCloneApp
//
//  Created by Yennifer Hurtado Arce on 16/08/22.
//

import UIKit

public enum TwitterImages: String {
    case icArrowBack = "ic_arrow_back"
    case icComment = "ic_comment"
    case icDownArrow = "ic_down_arrow"
    case icHomeUnselected = "ic_home_unselected"
    case icLikeFilled = "ic_like_filled"
    case icLikeUnselected = "ic_like_unselected"
    case icLike = "ic_like"
    case icLock = "ic_lock"
    case icMailBig = "ic_mail_big"
    case icMailSmall = "ic_mail_small"
    case icMainTwitterLogo = "ic_main_twitter_logo"
    case icMenu = "ic_menu"
    case icNewTweet = "ic_new_tweet"
    case icPerson = "ic_person"
    case icPlusPhoto = "ic_plus_photo"
    case icRetweet = "ic_retweet"
    case icSearchUnselected = "ic_search_unselected"
    case icShare = "ic_share"
    case icTwitterLogoBlue = "ic_twitter_logo_blue"
    
    public var image: UIImage? {
        UIImage(named: self.rawValue)
    }
    
    public var imageAlwaysTemplate: UIImage? {
        image?.withRenderingMode(.alwaysTemplate)
    }

    public var imageAlwaysOriginal: UIImage? {
        image?.withRenderingMode(.alwaysOriginal)
    }
}
