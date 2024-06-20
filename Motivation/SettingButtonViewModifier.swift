//
//  SettingButtonViewModifier.swift
//  Motivation
//
//  Created by William Tanil on 13/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingButton: ViewModifier {
    
    @Environment(\.isEnabled) var isEnabled
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.green)
            .padding()
            .background(isEnabled ? .clear : .green.opacity(0.1))
            .cornerRadius(16)
    }
}
