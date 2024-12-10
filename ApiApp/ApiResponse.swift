//
//  ApiResponse.swift
//  ApiApp
//
//  Created by UI3 on 2024/12/03.
//

import RealmSwift

struct ApiResponse: Decodable {
    var results: Result
    struct Result: Decodable {
        var shop: [Shop]
        struct Shop: Decodable {
            var id: String
            var name: String
            var logo_image: String
            var address: String
            var coupon_urls: CouponUrls
            struct CouponUrls: Decodable {
                var pc: String
                var sp: String
            }
            
            // テーブルに表示する店舗がお気に入りに登録されているかを判定できるようにする
            var isFavorite: Bool {
                if try! Realm().object(ofType: FavoriteShop.self, forPrimaryKey: self.id) != nil {
                    return true
                } else {
                    return false
                }
            }
            
        }
    }
}
