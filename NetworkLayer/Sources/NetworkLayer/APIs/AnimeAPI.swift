//
// AnimeAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class AnimeAPI {

    /**

     - parameter id: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getAnimeById(id: Int, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: GetAnimeById200Response?, _ error: Error?) -> Void)) -> RequestTask {
        return getAnimeByIdWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - GET /anime/{id}
     - parameter id: (path)  
     - returns: RequestBuilder<GetAnimeById200Response> 
     */
    open class func getAnimeByIdWithRequestBuilder(id: Int) -> RequestBuilder<GetAnimeById200Response> {
        var localVariablePath = "/anime/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetAnimeById200Response>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**

     - parameter id: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getAnimeCharacters(id: Int, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnimeCharacters?, _ error: Error?) -> Void)) -> RequestTask {
        return getAnimeCharactersWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - GET /anime/{id}/characters
     - parameter id: (path)  
     - returns: RequestBuilder<AnimeCharacters> 
     */
    open class func getAnimeCharactersWithRequestBuilder(id: Int) -> RequestBuilder<AnimeCharacters> {
        var localVariablePath = "/anime/{id}/characters"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnimeCharacters>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**

     - parameter page: (query)  (optional)
     - parameter limit: (query)  (optional)
     - parameter q: (query)  (optional)
     - parameter type: (query)  (optional)
     - parameter score: (query)  (optional)
     - parameter minScore: (query) Set a minimum score for results. (optional)
     - parameter maxScore: (query) Set a maximum score for results (optional)
     - parameter status: (query)  (optional)
     - parameter rating: (query)  (optional)
     - parameter sfw: (query) Filter out Adult entries (optional)
     - parameter genres: (query) Filter by genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3 (optional)
     - parameter genresExclude: (query) Exclude genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3 (optional)
     - parameter orderBy: (query)  (optional)
     - parameter sort: (query)  (optional)
     - parameter letter: (query) Return entries starting with the given letter (optional)
     - parameter producers: (query) Filter by producer(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3 (optional)
     - parameter startDate: (query) Filter by starting date. Format: YYYY-MM-DD. e.g &#x60;2022&#x60;, &#x60;2005-05&#x60;, &#x60;2005-01-01&#x60; (optional)
     - parameter endDate: (query) Filter by ending date. Format: YYYY-MM-DD. e.g &#x60;2022&#x60;, &#x60;2005-05&#x60;, &#x60;2005-01-01&#x60; (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getAnimeSearch(page: Int? = nil, limit: Int? = nil, q: String? = nil, type: AnimeSearchQueryType? = nil, score: Double? = nil, minScore: Double? = nil, maxScore: Double? = nil, status: AnimeSearchQueryStatus? = nil, rating: AnimeSearchQueryRating? = nil, sfw: Bool? = nil, genres: String? = nil, genresExclude: String? = nil, orderBy: AnimeSearchQueryOrderby? = nil, sort: SearchQuerySort? = nil, letter: String? = nil, producers: String? = nil, startDate: String? = nil, endDate: String? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: AnimeSearch?, _ error: Error?) -> Void)) -> RequestTask {
        return getAnimeSearchWithRequestBuilder(page: page, limit: limit, q: q, type: type, score: score, minScore: minScore, maxScore: maxScore, status: status, rating: rating, sfw: sfw, genres: genres, genresExclude: genresExclude, orderBy: orderBy, sort: sort, letter: letter, producers: producers, startDate: startDate, endDate: endDate).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     - GET /anime
     - parameter page: (query)  (optional)
     - parameter limit: (query)  (optional)
     - parameter q: (query)  (optional)
     - parameter type: (query)  (optional)
     - parameter score: (query)  (optional)
     - parameter minScore: (query) Set a minimum score for results. (optional)
     - parameter maxScore: (query) Set a maximum score for results (optional)
     - parameter status: (query)  (optional)
     - parameter rating: (query)  (optional)
     - parameter sfw: (query) Filter out Adult entries (optional)
     - parameter genres: (query) Filter by genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3 (optional)
     - parameter genresExclude: (query) Exclude genre(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3 (optional)
     - parameter orderBy: (query)  (optional)
     - parameter sort: (query)  (optional)
     - parameter letter: (query) Return entries starting with the given letter (optional)
     - parameter producers: (query) Filter by producer(s) IDs. Can pass multiple with a comma as a delimiter. e.g 1,2,3 (optional)
     - parameter startDate: (query) Filter by starting date. Format: YYYY-MM-DD. e.g &#x60;2022&#x60;, &#x60;2005-05&#x60;, &#x60;2005-01-01&#x60; (optional)
     - parameter endDate: (query) Filter by ending date. Format: YYYY-MM-DD. e.g &#x60;2022&#x60;, &#x60;2005-05&#x60;, &#x60;2005-01-01&#x60; (optional)
     - returns: RequestBuilder<AnimeSearch> 
     */
    open class func getAnimeSearchWithRequestBuilder(page: Int? = nil, limit: Int? = nil, q: String? = nil, type: AnimeSearchQueryType? = nil, score: Double? = nil, minScore: Double? = nil, maxScore: Double? = nil, status: AnimeSearchQueryStatus? = nil, rating: AnimeSearchQueryRating? = nil, sfw: Bool? = nil, genres: String? = nil, genresExclude: String? = nil, orderBy: AnimeSearchQueryOrderby? = nil, sort: SearchQuerySort? = nil, letter: String? = nil, producers: String? = nil, startDate: String? = nil, endDate: String? = nil) -> RequestBuilder<AnimeSearch> {
        let localVariablePath = "/anime"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "page": page?.encodeToJSON(),
            "limit": limit?.encodeToJSON(),
            "q": q?.encodeToJSON(),
            "type": type?.encodeToJSON(),
            "score": score?.encodeToJSON(),
            "min_score": minScore?.encodeToJSON(),
            "max_score": maxScore?.encodeToJSON(),
            "status": status?.encodeToJSON(),
            "rating": rating?.encodeToJSON(),
            "sfw": sfw?.encodeToJSON(),
            "genres": genres?.encodeToJSON(),
            "genres_exclude": genresExclude?.encodeToJSON(),
            "order_by": orderBy?.encodeToJSON(),
            "sort": sort?.encodeToJSON(),
            "letter": letter?.encodeToJSON(),
            "producers": producers?.encodeToJSON(),
            "start_date": startDate?.encodeToJSON(),
            "end_date": endDate?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<AnimeSearch>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}