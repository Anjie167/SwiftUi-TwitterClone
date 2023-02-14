//
//  RoundedShape.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/10/23.
//

import SwiftUI

struct RoundedShape: Shape{
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        return Path(path.cgPath);
    }
}
