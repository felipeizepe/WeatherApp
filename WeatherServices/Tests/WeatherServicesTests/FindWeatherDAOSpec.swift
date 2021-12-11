
import Foundation
import Quick
import Nimble
@testable import WeatherServices

class FindWeatherDAOSpec: QuickSpec {

    override func spec() {

        var sut: FindWeatherDAO!
        var networkMock: NetworkCoreMock!

        describe("given a FindWeatherDAO") {
            beforeEach {
                networkMock = NetworkCoreMock()
                sut = FindWeatherDAO(networkCore: networkMock)
            }

            context("when calling find weather with valid response") {
                beforeEach {
                    guard let bundleUrl = Bundle.module.url(forResource: "reports", withExtension: "json"),
                          let data = try? Data(contentsOf: bundleUrl) else {
                              fail("Missing file: reports.json")
                              return
                          }
                    networkMock.mockResponse = .success(data)
                }

                it("should perform the request correctly") {
                    let id = 4118

                    waitUntil(timeout: .seconds(5)) { done in
                        sut.findWeather(locationId: id) { result in
                            switch result {
                            case .success(let reports):
                                expect(reports.count).to(equal(6))
                            case .failure(_):
                                fail("Should not fail")
                            }

                            done()
                        }
                    }
                }
            }

            context("when calling find weather with no data response") {
                beforeEach {
                    networkMock.mockResponse = .error(.noData, nil, nil)
                }

                it("should return request failiure") {
                    let id = 4118

                    waitUntil(timeout: .seconds(5)) { done in
                        sut.findWeather(locationId: id) { result in
                            switch result {
                            case .success(_):
                                fail("Should not succeed")
                            case .failure(let error):
                                expect(error.statusCode).to(equal(.noData))
                            }

                            done()
                        }
                    }
                }
            }
        }
    }
}
