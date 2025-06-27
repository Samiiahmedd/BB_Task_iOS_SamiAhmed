import Foundation
import NetworkLayer

class BaseRemoteDataSource {
    let network = APIRequestHandler()

    
    func checkModelErrorResponse<T: ErrorRepresentable>(_ response: T) throws -> T {
        guard response.success ?? true else {
            throw NetworkError.customError(error: response.statusMessage ?? "Unknown error")
        }
        return response
    }

    func extractData<T>(_ response: BaseModel<T>) throws -> T {
        guard response.status == .success, let data = response.data else {
            throw NetworkError.customError(error: response.message ?? "defult_error.m".localized(from: .MainApp))
        }
        return data
    }
    
    func checkResponse(_ response: BaseModel<EmptyEntity>) throws {
        guard response.status == .success else {
            throw NetworkError.customError(error: response.message ?? "defult_error.m".localized(from: .MainApp))
        }
    }
}
