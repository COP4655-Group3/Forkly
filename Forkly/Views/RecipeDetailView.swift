//
//  RecipeDetailView.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: RecipeDetail
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        let cleanedSummary = recipe.summary?.cleanHTMLTags() ?? ""
        let cleanedInstructions = recipe.instructions?.cleanHTMLTags() ?? ""
        let instructionSteps = cleanedInstructions.splitIntoSteps()
        
        return ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Image
                if let imageUrl = recipe.image, !imageUrl.isEmpty, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 250)
                    .clipped()
                    .cornerRadius(16)
                } else {
                    // Fallback image or empty space
                    Color.gray
                        .frame(height: 250)
                        .cornerRadius(16)
                }
                
                // Title
                Text(recipe.title)
                    .font(.title)
                    .bold()
                
                // Summary
                if !cleanedSummary.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Summary")
                            .font(.headline)

                        Text(cleanedSummary)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(6)
                            .padding(.leading, 4) // this creates a paragraph indent feel
                    }
                }
                
                // Instructions
                VStack(alignment: .leading, spacing: 8) {
                    Text("Instructions")
                        .font(.headline)
                    
                    if instructionSteps.isEmpty {
                        Text("No instructions available.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(Array(instructionSteps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top) {
                                Text("\(index + 1).")
                                    .bold()
                                Text(step)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 2)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension String {
    func splitIntoSteps() -> [String] {
        let cleaned = self.cleanHTMLTags()
        // Break on periods followed by a space and a capital letter
        let pattern = #"(?<=[.?!])\s+(?=[A-Z])"#
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: cleaned.utf16.count)
        let matches = regex?.matches(in: cleaned, options: [], range: range) ?? []

        var lastIndex = cleaned.startIndex
        var results: [String] = []

        for match in matches {
            let nsRange = match.range
            let swiftRange = Range(nsRange, in: cleaned)!
            let step = String(cleaned[lastIndex..<swiftRange.lowerBound]).trimmingCharacters(in: .whitespacesAndNewlines)
            results.append(step)
            lastIndex = swiftRange.lowerBound
        }

        // Add remaining text
        let lastStep = String(cleaned[lastIndex...]).trimmingCharacters(in: .whitespacesAndNewlines)
        if !lastStep.isEmpty {
            results.append(lastStep)
        }

        return results
    }
    
    func cleanHTMLTags() -> String {
            guard let data = self.data(using: .utf8) else { return self }
            if let attributed = try? NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            ) {
                return attributed.string
            }
            return self
        }
    }
