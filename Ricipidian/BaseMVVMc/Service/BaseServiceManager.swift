//
//  BaseServiceManager.swift
//  Ricipidian
//
//  Created by Minh Tâm on 21/03/2021.
//

import Alamofire
import RxAlamofire
import RxSwift

struct Header {
    static let ContentType = "Content-Type"
    static let Accept = "Accept"
    static let Authorization = "Authorization"
    static let ApplicationFormUrlencoded = "application/x-www-form-urlencoded"
    static let ApplicationFormData = "application/form-data"
    static let ApplicationJson = "application/json"
    static let MultipartFormData = "multipart/form-data"
    static let TextHtml = "text/html"
    static let Language = "language"
}

class BaseServiceRxManager {
    var baseURL: String = ""
    var headers: HTTPHeaders = [:]
    var timeOut = 10

    let session = URLSession.shared
    let disposeBag = DisposeBag()
    var sessionManager: Alamofire.Session!

    init(baseURL: String) {
        self.baseURL = baseURL
        sessionConfiguration()
    }

    func sessionConfiguration() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = TimeInterval(timeOut)
        config.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        sessionManager = Alamofire.Session(configuration: config)
    }

    func updateHeaderIfNeed(key: String, value: String) {
        headers.update(name: key, value: value)
    }

    func baseURLAppend(path: String) -> String {
        let fullPath = baseURL + path
        // print("-----> fullPath: " + fullPath)
        return fullPath
    }

    func request<T>(type: T.Type,
                    method: HTTPMethod,
                    parameters: [String: Any]?,
                    pathURL: String, useFullPathURL: Bool = false) -> Observable<T>
        where T: Decodable {
        if !NetworkState.isConnected() {
            NotificationCenter.default.post(name: NSNotification.Name(NotifyName.notifiName_NotNetwork), object: nil)
            return Observable.create { (observer) -> Disposable in
                observer.onError(CommonError())
                return Disposables.create()
            }
        }

        return Observable.create { (observer) -> Disposable in
            var url = self.baseURLAppend(path: pathURL)
            if useFullPathURL {
                url = pathURL // Sử dụng tham số pathURL làm url full khi request khi
            }
            //  printLogMessage("-----> \(url)")
            var encoding: ParameterEncoding = URLEncoding.default
            if method != .get && self.headers[Header.ContentType] == Header.ApplicationJson {
                encoding = JSONEncoding.default

                self.printParamsBody(params: parameters, url: url)
            } else {
                printLogMessageRequest("-----> \(url)")
                printLogMessageRequest(parameters)
            }

            // printLogMessageRequest(parameters)

            self.sessionManager.rx
                .request(method, url, parameters: parameters, encoding: encoding, headers: self.headers)
                .observe(on: ConcurrentDispatchQueueScheduler(qos: .background))
                // .observeOn(MainScheduler.instance)
                .responseData()
                .subscribe(onNext: { httpResponse, data in
                    if httpResponse.statusCode == HTTPStatusCode.code401.rawValue {
                        NotificationCenter.default.post(name: NSNotification.Name(NotifyName.notifiName_InvalidToken), object: nil)
                        let error = ApiError(message: httpResponse.description.description)
                        observer.onError(error)
                        self.printResponse(data: data, url: url)
                        return
                    }

//                    printLogMessageResponse(String(data: data, encoding: .utf8))
                    self.printResponse(data: data, url: url)

                    let decoder = JSONDecoder()
                    do {
                        let parsedData = try decoder.decode(type, from: data)
                        if let message = parsedData as? BaseResponse, message.mess?.code != 1 {
                            let error = ApiError(errCode: message.mess?.code ?? -1, message: message.mess?.description ?? "")
                            observer.onError(error)
                        } else {
                            observer.onNext(parsedData as T)
                        }
                    } catch {
                        printLogMessageResponse(error)
                        guard let status = HTTPStatusCode(rawValue: httpResponse.statusCode) else {
                            observer.onError(Constant.MappingObjectError)
                            return
                        }
                        var messageError = status.message
                        if messageError == "" {
                            messageError = self.getJsonFromData(data)
                        }

                        let error = ApiError(errCode: status.rawValue, message: messageError)
                        observer.onError(error)

                        printLogMessageError(messageError)
                    }
                }, onError: { error in
                    observer.onError(ApiError(errCode: 0, message: error.localizedDescription))
                    printLogMessageResponse(error.localizedDescription)
                }, onCompleted: {
                    observer.onCompleted()
                }) {
                }.disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }

    private struct Constant {
        static var MappingObjectError: ApiError {
            return ApiError(errCode: HTTPStatusCode.codeMapping.rawValue, message: HTTPStatusCode.codeMapping.message)
        }
    }

    private func printParamsBody(params: [String: Any]?, url: String) {
        #if DEBUG
            do {
                var paramsPrint = params ?? [:]
                if paramsPrint.keys.contains("avatar") == true {
                    paramsPrint["avatar"] = "Không in ra chuỗi base 64 này"
                }
                let jsonData = try JSONSerialization.data(withJSONObject: paramsPrint, options: JSONSerialization.WritingOptions.prettyPrinted)
                let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                print("Body: \(url)\n===============\n\(jsonString)\n===============")
            } catch {
                print("Response error parser json")
            }
        #endif
    }

    private func printResponse(data: Data, url: String) {
        #if DEBUG
            print("Response: \(url)\n===============\n\(getJsonFromData(data))\n===============")
        #endif
    }

    private func getJsonFromData(_ data: Data) -> String {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: [JSONSerialization.WritingOptions.prettyPrinted])
            let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
            return jsonString
        } catch {
            return "Không parse được dữ liệu"
        }
    }
}

// MARK: - Properties

protocol CustomError: Error {
    var errCode: Int? { get set }
    var message: String? { get set }
    var others: Any? { get set }
}

class CommonError: Error {
}

class ApiError: CustomError {
    var errCode: Int?
    var message: String?

    var others: Any?

    init(errCode: Int = 0, message: String = "", others: Any? = nil) {
        self.errCode = errCode
        self.message = message
        self.others = others
    }
}

public enum HTTPStatusCode: Int {
    // OK
    case code200 = 200

    // Mapping Object
    case codeMapping = 99

    // Invalid parameter supplied
    case code400 = 400

    // Invalid Token
    case code401 = 401

    // Timeout
    case code408 = 408

    // Too many requests
    case code429 = 429

    // Network error
    case code404 = 404

    // TODO: Implement on each project
    var message: String {
        switch self {
        case .code400:
            return "Lỗi parameter"
        case .codeMapping:
            return "Lỗi paser jSON"
        case .code401:
            return "Lỗi token hết hạn"
        case .code408:
            return "Lỗi timeOut"
        case .code429:
            return "Lỗi Nhiều request"
        case .code404:
            return "Lỗi mạng"
        default:
            return "Lỗi không xác định"
        }
    }
}
