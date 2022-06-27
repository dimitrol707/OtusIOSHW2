//
//  NetworkingManager.swift
//  
//
//  Created by Дмитрий Мальцев on 27.06.2022.
//

import SwiftUI
import Combine

public class NetworkingManager {
       
    public static func download(url: URL) -> AnyPublisher<Data, Error>  {
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap {
                output in
                try handleURLResponse(output: output, url: url)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw URLError(.badURL)
              }
        return output.data
    }
    
    public static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Error handleCompletion: " + error.localizedDescription)
        }
    }
}
