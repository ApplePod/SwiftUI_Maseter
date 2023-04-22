//
//  PageModel.swift
//  Pinch
//
//  Created by Herry on 2023/04/22.
//

import Foundation

struct Page: Identifiable {
    let id: Int // 식별 번호
    let imageName: String
    
    
}

extension Page {
    var thumbnailNave: String {
        return "thumb-" + imageName
    }
}
