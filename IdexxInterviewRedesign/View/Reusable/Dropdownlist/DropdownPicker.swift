//
//  DropdownPicker.swift
//  IdexxInterviewRedesign
//
//  Created by Keijaoh Campbell on 6/16/22.
//


import SwiftUI

struct DropdownPicker: View {
    
    var title: String
    var placeholder: String
    @Binding var selection: Int
    var options: [String] 
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showOptions: Bool = false
    
    var body: some View {
        ZStack {
            // Static row which shows user's current selection
            HStack {
                Text(title).font(.callout).foregroundColor(.secondary).bold()
                Spacer()
                Text(options[selection]).foregroundColor(colorScheme == .dark ? Color.white : Color.black).font(.title2).bold()
                    .foregroundColor(Color.black.opacity(0.6))
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
            }
            .font(Font.custom("Avenir Next", size: 16).weight(.medium))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(UIColor.systemBackground))
            .onTapGesture {
                // show the dropdown options
                withAnimation(Animation.spring().speed(2)) {
                    showOptions = true
                }
            }
            
            // Drop down options
            if showOptions {
                VStack(alignment: .leading, spacing: 4) {
                    Text(placeholder)
                        //.font(Font.custom("Avenir Next", size: 26).weight(.semibold))
                        .foregroundColor(.secondary)
                    VStack {
                        Spacer()
                        ForEach(options.indices, id: \.self) { i in
                            if i == selection {
                                Text(options[i])
                                    .font(.system(size: 26))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(4)
                                    .onTapGesture {
                                        // hide dropdown options - user selection didn't change
                                        withAnimation(Animation.spring().speed(2)) {
                                            showOptions = false
                                        }
                                    }
                            } else {
                                Text(options[i])
                                    .font(.system(size: 22))
                                    .onTapGesture {
                                        // update user selection and close options dropdown
                                        withAnimation(Animation.spring().speed(2)) {
                                            selection = i
                                            showOptions = false
                                        }
                                    }
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical, 2)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(UIColor.systemBackground))
                .foregroundColor(.secondary)
                .transition(.opacity)
                
            }
            
        }
    }
}

