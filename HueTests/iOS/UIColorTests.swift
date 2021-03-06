@testable import Hue
import UIKit
import XCTest

class UIColorTests: XCTestCase {

  func testHex() {
    let white = UIColor.hex("#FFFFFF")
    let black = UIColor.hex("000000")
    let red = UIColor.hex("F00")
    let blue = UIColor.hex("#00F")
    let green = UIColor.hex("#00FF00")
    let yellow = UIColor.hex("#FFFF00")

    XCTAssertEqual(white, UIColor(red: 255, green: 255, blue: 255, alpha: 1.0))
    XCTAssertEqual(black, UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    XCTAssertEqual(red, UIColor(red: 255, green: 0, blue: 0, alpha: 1.0))
    XCTAssertEqual(blue, UIColor(red: 0, green: 0, blue: 255, alpha: 1.0))
    XCTAssertEqual(green, UIColor(red: 0, green: 255, blue: 0, alpha: 1.0))
    XCTAssertEqual(yellow, UIColor(red: 255, green: 255, blue: 0, alpha: 1.0))
  }

  func testToHexWithPrefix() {
    let white = UIColor.whiteColor()
    let black = UIColor.blackColor()
    let red = UIColor.redColor()
    let blue = UIColor.blueColor()
    let green = UIColor.greenColor()
    let yellow = UIColor.yellowColor()

    XCTAssertEqual(white.hex(), "#FFFFFF")
    XCTAssertEqual(black.hex(), "#000000")
    XCTAssertEqual(red.hex(), "#FF0000")
    XCTAssertEqual(blue.hex(), "#0000FF")
    XCTAssertEqual(green.hex(), "#00FF00")
    XCTAssertEqual(yellow.hex(), "#FFFF00")
  }

  func testToHexWithoutPrefix() {
    let white = UIColor.whiteColor()
    let black = UIColor.blackColor()
    let red = UIColor.redColor()
    let blue = UIColor.blueColor()
    let green = UIColor.greenColor()
    let yellow = UIColor.yellowColor()

    XCTAssertEqual(white.hex(withPrefix: false), "FFFFFF")
    XCTAssertEqual(black.hex(withPrefix: false), "000000")
    XCTAssertEqual(red.hex(withPrefix: false), "FF0000")
    XCTAssertEqual(blue.hex(withPrefix: false), "0000FF")
    XCTAssertEqual(green.hex(withPrefix: false), "00FF00")
    XCTAssertEqual(yellow.hex(withPrefix: false), "FFFF00")
  }

  func testAlpha() {
    let yellowWithAlpha = UIColor.hex("#FFFF00").alpha(0.5)

    XCTAssertEqual(yellowWithAlpha, UIColor(red: 255, green: 255, blue: 0, alpha: 1.0).colorWithAlphaComponent(0.5))
  }

  func testGradient() {
    let testGradient = [UIColor.blackColor(), UIColor.orangeColor()].gradient()

    XCTAssertTrue(testGradient.isKindOfClass(CAGradientLayer))
    XCTAssertEqual(testGradient.colors?.count, 2)
    XCTAssertEqual(
      CGColorSpaceGetModel(CGColorGetColorSpace((testGradient.colors as! [CGColor])[0])),
      CGColorSpaceGetModel(CGColorGetColorSpace(UIColor.blackColor().CGColor)))
    XCTAssertEqual(
      CGColorSpaceGetModel(CGColorGetColorSpace((testGradient.colors as! [CGColor])[1])),
      CGColorSpaceGetModel(CGColorGetColorSpace(UIColor.orangeColor().CGColor)))

    let testGradientWithLocation = [UIColor.blueColor(), UIColor.yellowColor()].gradient { gradient in
      gradient.locations = [0.25, 1.0]
      return gradient
    }

    XCTAssertTrue(testGradient.isKindOfClass(CAGradientLayer))
    XCTAssertEqual(testGradient.colors?.count, 2)
    XCTAssertEqual(
      CGColorSpaceGetModel(CGColorGetColorSpace((testGradientWithLocation.colors as! [CGColor])[0])),
      CGColorSpaceGetModel(CGColorGetColorSpace(UIColor.blueColor().CGColor)))
    XCTAssertEqual(
      CGColorSpaceGetModel(CGColorGetColorSpace((testGradientWithLocation.colors as! [CGColor])[1])),
      CGColorSpaceGetModel(CGColorGetColorSpace(UIColor.yellowColor().CGColor)))
    XCTAssertEqual(testGradientWithLocation.locations!, [0.25,1.0])
  }
}
