//
//  BadgeBackground.swift
//  NiceSwift
//
//  Created by zack on 2021/2/4.
//

import SwiftUI

struct BadgeBackground: View {
    
    static let gradientStart: Color = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd: Color = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var with: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = with
                let scale: CGFloat = 0.832
                let xOffset = (with * (1 - scale)) / 2.0
                with *= scale
                
                path.move(to:
                            CGPoint(x: with * 0.95 + xOffset,
                                    y: height * (0.20 + HexagonParameters.adjustment))
                )
                
                HexagonParameters.segments.forEach { segment in
                    
                    path.addLine(to: CGPoint(x: with * segment.line.x + xOffset,
                                             y: height * segment.line.y))
                    
                    path.addQuadCurve(to: CGPoint(x: with * segment.curve.x + xOffset,
                                                  y: height * segment.curve.y),
                                      control: CGPoint(x: with * segment.control.x + xOffset,
                                                       y: height * segment.control.y))
                }
                
            }.fill(LinearGradient(gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.6)))
        }.aspectRatio(1, contentMode: .fit)
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
