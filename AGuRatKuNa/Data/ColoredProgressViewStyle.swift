//
//  ColoredProgressViewStyle.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/27.
//

import Foundation
import SwiftUI

struct ColoredProgressViewStyle: ProgressViewStyle {
    var theme: Theme
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
            ProgressView(configuration)
                .tint(theme.mainColor)
                .frame(height: 12.0)
                .padding(.horizontal)
        }
    }
}

struct ColoredProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.4)
            .progressViewStyle(ColoredProgressViewStyle(theme: .gaonRed))
            .previewLayout(.sizeThatFits)
    }
}
