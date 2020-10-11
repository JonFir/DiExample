import Foundation
import Alamofire
import Combine

protocol AccountApiClient {
    func makeToken() -> AnyPublisher<AccountApiClientDefault.MakeTokenResponse, Error>
    
    func validateUser(
        username: String,
        password: String,
        token: String
    ) -> AnyPublisher<AccountApiClientDefault.ValidateUserResponse, Error>
    
    func makeSession(token: String) -> AnyPublisher<AccountApiClientDefault.MakeSessionResponse, Error>
}

final class AccountApiClientDefault: AccountApiClient {
    
    private let requestBuilder: RequestBuilder
    private let apiClient: ApiClient
    
    init(
        requestBuilder: RequestBuilder,
        apiClient: ApiClient
    ) {
        self.requestBuilder = requestBuilder
        self.apiClient = apiClient
    }
    
    struct MakeTokenResponse: Decodable {
        let requestToken: String
    }
    
    func makeToken() -> AnyPublisher<AccountApiClientDefault.MakeTokenResponse, Error> {
        
        let request = requestBuilder.build(
            path: "/authentication/token/new",
            method: .get,
            urlParamters: [:],
            jsonParamters: [:]
        )
        
        return apiClient.performRequest(request)
    }
    
    struct ValidateUserResponse: Decodable {
        let requestToken: String
    }
    
    func validateUser(
        username: String,
        password: String,
        token: String
    ) -> AnyPublisher<AccountApiClientDefault.ValidateUserResponse, Error> {
        
        let request = requestBuilder.build(
            path: "/authentication/token/validate_with_login",
            method: .post,
            urlParamters: [:],
            jsonParamters: [
                "username": username,
                "password": password,
                "request_token": token
            ]
        )
        return apiClient.performRequest(request)
    }
    
    struct MakeSessionResponse: Decodable {
        let sessionId: String
    }
    
    func makeSession(token: String) -> AnyPublisher<AccountApiClientDefault.MakeSessionResponse, Error> {
        let request = requestBuilder.build(
            path: "/authentication/session/new",
            method: .post,
            urlParamters: [:],
            jsonParamters: ["request_token": token]
        )
        
        return apiClient.performRequest(request)
    }
    
}
