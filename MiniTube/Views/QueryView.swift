//
//  QueryView.swift
//  MiniTube
//
//  Created by sergio shaon on 19/2/22.
//

import SwiftUI

struct QueryView: View {
    var query: String
    var isSelected: Bool
    
    var body: some View {
        Text(query)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.thinMaterial)
            .foregroundColor(isSelected ? .black : .gray)
            .cornerRadius(10)
            .font(.caption2)
        
    }
}

struct QueryView_Previews: PreviewProvider {
    static var previews: some View {
        QueryView(query: "Nature", isSelected: false)
    }
}
