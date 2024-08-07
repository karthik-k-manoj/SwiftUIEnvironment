//
//  LogLayout.swift
//  SwiftUIEnvironment
//
//  Created by Karthik K Manoj on 01/07/24.
//

import SwiftUI

extension View {
    func logSizes(_ label: String) -> some View {
        LogSizes(label: label) { self }
    }
}

extension CGFloat {
    var pretty: String {
        String(format: "%.2f", self)
    }
}

extension CGSize {
    var pretty: String {
        "\(width.pretty)⨉\(height.pretty)"
    }
}

extension Optional where Wrapped == CGFloat {
    var pretty: String {
        self?.pretty ?? "nil"
    }
}

extension ProposedViewSize {
    var pretty: String {
        "\(width.pretty)⨉\(height.pretty)"
    }
}

struct LogSizes: Layout {
    var label: String
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        assert(subviews.count == 1)
        print("Propose \(label): \(proposal.pretty)")
        let result = subviews[0].sizeThatFits(proposal)
        print("Report \(label): \(result.pretty)")
        return result
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        subviews[0].place(at: bounds.origin, proposal: proposal)
    }
}
