//
//  NetworkCoreSpec.swift
//  
//
//  Created by Felipe Izepe on 10/12/21.
//

import Foundation
import Quick
import Nimble
@testable import RequestCommons

class NetworkCoreSpec: QuickSpec {

    override func spec() {

        var sut: NetworkCore!
        var request: NetworkRequest!

        describe("given a NetworkCore") {

            beforeEach {
                sut = NetworkCore()
            }

            context("when pereforming a valid request") {
                beforeEach {
                    let url = URL(string: "https://google.com")!
                    request = NetworkRequest(url: url, method: .get)
                }

                it("should perform the request correctly") {

                    waitUntil { done in
                        sut.performRequest(request) { response in
                            switch response {
                            case .success(let data):
                                expect(data).toNot(beNil())
                            case .error(_, _, _):
                                fail("Should not fail")
                            }
                            done()
                        }
                    }
                }
            }

            context("when pereforming an invalid request") {
                beforeEach {
                    let url = URL(string: "googlem")!
                    request = NetworkRequest(url: url, method: .get)
                }

                it("should perform the request with error") {

                    waitUntil { done in
                        sut.performRequest(request) { response in
                            switch response {
                            case .success(_):
                                fail("Should fail")
                            case let .error(status, error, _):
                                expect(status).to(equal(.unkown))
                                expect(error).toNot(beNil())
                            }
                            done()
                        }
                    }
                }
            }
        }

    }
}
