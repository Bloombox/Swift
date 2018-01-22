
import XCTest
@testable import Schema
@testable import Client


class ClientTests: XCTestCase {
    func testMenuDownload() throws {
      let client: Bloombox = Bloombox(settings: Bloombox.Settings(apiKey: "AIzaSyBpeziyO5YE-EIyt8ervAX8eSM0qFHd4T4", partner: "mm", location: "sacramento"))
      do {
        let menu = try client.menu.retrieve()
        print("menu items: \(menu.count)")
      } catch (MenuClientError.invalidApiKey) {
        print("error: invalid API key")
      } catch (MenuClientError.invalidPartnerCode) {
        print("error: invalid partner")
      } catch (MenuClientError.invalidLocationCode) {
        print("error: invalid location")
        throw MenuClientError.invalidLocationCode
      } catch (Services_Menu_V1Beta1_MenuClientError.invalidMessageReceived) {
        print("error: invalid message")
        throw Services_Menu_V1Beta1_MenuClientError.invalidMessageReceived
      } catch (Services_Menu_V1Beta1_MenuClientError.endOfStream) {
        print("error: unexpected end of stream")
        throw Services_Menu_V1Beta1_MenuClientError.endOfStream
      } catch (Services_Menu_V1Beta1_MenuClientError.error(let result)) {
        print("error: got result \(result)")
        throw Services_Menu_V1Beta1_MenuClientError.error(c: result)
      }
    }

    static var allTests = [
        ("testMenuDownload", testMenuDownload),
    ]
}
