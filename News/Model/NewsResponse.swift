//
//  NewsResponse.swift
//  News
//
//  Created by Thomas Schatton on 30.06.22.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    var articles: [Article]
}

struct Article: Codable, Hashable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
    
    static let example = Article(source: Source(id: "the-verge", name: "The Verge"), author: "Richard Lawler", title: "Tesla layoffs reportedly affect hourly workers, too", description: "Elon Musk told Tesla employees layoffs would affect 10 percent of salaried workers. Reports from Electrek and Reuters note hourly workers have also been let go recently, and job postings from Tesla have dropped.", url: "https://www.theverge.com/2022/6/17/23172435/tesla-layoffs-expand-elon-musk-hourly-salaried", urlToImage: "https://cdn.vox-cdn.com/thumbor/DfrBCvbn2RE3gi3KUPOZbr2ER7M=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/19398931/tesla.jpg", publishedAt: .now, content: "Elon Musk emailed employees two weeks ago focusing on reductions in headcount for salaried employees\r\nIllustration by Alex Castro / The Verge\r\nAccording to a report from Electrek, a wave of layoffs a… [+2021 chars]")
    
    static let htmlExample = Article(source: Source(id: "the-times-of-india", name: "The Times of India"), author: "TIMESOFINDIA.COM", title: "God of War Ragnarok releasing this November on PlayStation: Here’s everything you need to know - Times of India", description: "<ol><li>God of War Ragnarok releasing this November on PlayStation: Here’s everything you need to know  Times of India\r\n</li><li>God of War Ragnarök Release Date Confirmed Alongside Special Editions  ComingSoon.net\r\n</li><li>‘God Of War Ragnarok’ Finally Gets…", url: "https://timesofindia.indiatimes.com/gadgets-news/god-of-war-ragnarok-releasing-this-november-on-playstation-heres-everything-you-need-to-know/articleshow/92719618.cms", urlToImage: "https://static.toiimg.com/thumb/msid-92724803,width-1070,height-580,imgsize-549327,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg", publishedAt: .now, content: "God of War Ragnarök - \"Father and Son\" Cinematic Trailer | PS5 &amp; PS4 Games")
}

struct Source: Codable, Hashable {
    let id: String?
    let name: String?
}

struct ReadingListItem: Codable, Hashable {
    var article: Article
    var articleRead = false
}

