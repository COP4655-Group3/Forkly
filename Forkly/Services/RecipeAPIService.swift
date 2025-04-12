//
//  RecipeAPIService.swift
//  Forkly
//
//  Created by Juan Rodriguez on 4/12/25.
//

import Foundation


class RecipeAPIService {
    private let apiKey = "d3541e6f96e94592bda1707beae87bc0" // API Key
    private let baseSearchURL = "https://api.spoonacular.com/recipes/complexSearch"
    private let detailURL = "https://api.spoonacular.com/recipes/"

    // MARK: - Search Recipes
    func searchRecipes(query: String, completion: @escaping ([Recipe]?) -> Void) {
        guard var urlComponents = URLComponents(string: baseSearchURL) else {
            completion(nil)
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "number", value: "10"),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]

        guard let url = urlComponents.url else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Search API Error: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoded = try JSONDecoder().decode(RecipeSearchResponse.self, from: data)
                completion(decoded.results)
            } catch {
                print("Search Decoding Error: \(error)")
                completion(nil)
            }
        }.resume()
    }

    // MARK: - Get Recipe Details
    func getRecipeDetails(id: Int, completion: @escaping (Result<RecipeDetail, Error>) -> Void) {
        let urlString = "\(detailURL)\(id)/information?apiKey=\(apiKey)"

        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }

            do {
                let detail = try JSONDecoder().decode(RecipeDetail.self, from: data)
                completion(.success(detail))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // MARK: - Get Featured Recipes (Random)
    func fetchFeaturedRecipes(completion: @escaping ([Recipe]?) -> Void) {
        let urlString = "https://api.spoonacular.com/recipes/random?number=5&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Featured API Error: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoded = try JSONDecoder().decode(FeaturedRecipeResponse.self, from: data)
                completion(decoded.recipes)
            } catch {
                print("Featured Decoding Error: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

// MARK: - Response Wrapper

struct RecipeSearchResponse: Codable {
    let results: [Recipe]
}

// MARK: - Random Recipe Response Wrapper
struct FeaturedRecipeResponse: Codable {
    let recipes: [Recipe]
}
