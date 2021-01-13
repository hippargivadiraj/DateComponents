import UIKit
import SwiftUI

var str = "Hello, playground"

let currentDate = Date()


let oneMinuteFromNow  = Date.init(timeIntervalSinceNow: 60)


//Formats Date components
let dateFormatter = DateFormatter()

print("full")
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full
print(dateFormatter.string(from: currentDate))
print(" ")

print("long")
dateFormatter.dateStyle = .long
dateFormatter.timeStyle = .long
print(dateFormatter.string(from: currentDate))
print(" ")

print("medium")
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .medium
print(dateFormatter.string(from: currentDate))
print(" ")

print("short")
dateFormatter.dateStyle = .short
dateFormatter.timeStyle = .short
print(dateFormatter.string(from: currentDate))
print(" ")


print("none")
dateFormatter.dateStyle = .none
dateFormatter.timeStyle = .none
print(dateFormatter.string(from: currentDate))
print(" ")

print("MMMM dd")
dateFormatter.dateFormat = "MMMM dd"
print(dateFormatter.string(from: currentDate))
print(" ")

print("MMMM dd yyyy")
dateFormatter.dateFormat = "MMMM dd yyyy"
print(dateFormatter.string(from: currentDate))
print(" ")

print("TimeZones")
dateFormatter.timeZone = TimeZone(identifier: "UTC")
dateFormatter.dateFormat = "yyyy-MM-dd 'T' HH:mm:ss"
print(dateFormatter.string(from: currentDate))
print(" ")

//This will convert Data String Back to Date
print("Convert String to a Date")
dateFormatter.timeZone = TimeZone(identifier: "UTC")
dateFormatter.dateFormat = "yyyy-MM-dd 'T' HH:mm:ss"
let dateString = "2021-01-06 T 19:31:45"
let dateFromDateString = dateFormatter.date(from: dateString)
print(dateFromDateString ?? Date())
print(" ")


//This will convert Data String Back to Date
print("Convert String to a Date A Different String Format")
dateFormatter.timeZone = TimeZone(identifier: "UTC")
dateFormatter.dateFormat = "yyyy-MM-dd 'Times:' HH:mm:ss"
let dateString2 = "2021-01-06 Times: 19:31:45"
let dateFromDateString2 = dateFormatter.date(from: dateString)
print(dateFromDateString2 ?? Date())
print(" ")

//This will extract Date Components
print("This will extract Date Components")
let components = Calendar.current.dateComponents([Calendar.Component.day,
                                                  Calendar.Component.month,
                                                  Calendar.Component.year], from: currentDate)
print("Day:\(components.day! ) Month:\(components.month! ) Year:\(components.year! )")
print(" ")


//Create Date From Components
let calendar = Calendar.current
let components2 = DateComponents.init(calendar: calendar, timeZone:TimeZone(identifier: "PST"), year: 2021, month: 05, day: 02)
let newDate = calendar.date(from: components2)
print(newDate! as Any)
print(" ")

//Comparing Two Dates
print("Comparing Two Dates")
let date_now = Date()
let date_formatter = DateFormatter()
date_formatter.timeZone = TimeZone(identifier: "UTC")
date_formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
let oldDateString = "2022-08-05T20:20:20"
let date_old = date_formatter.date(from: oldDateString)
print(date_old ?? Date())
print(" ")

let comonentDifference = Calendar.current.dateComponents([
    Calendar.Component.year,
    Calendar.Component.month,
    Calendar.Component.day,
    Calendar.Component.hour,
    Calendar.Component.minute,
    Calendar.Component.second

], from: date_now, to: date_old!)



print("Compared Dates")
print("Year :\(comonentDifference.year!)")
print("Month :\(comonentDifference.month!)")
print("Day :\(comonentDifference.day!)")
print("Hour :\(comonentDifference.hour!)")
print("Min :\(comonentDifference.minute!)")
print("Seconds :\(comonentDifference.second!)")


//FIREBASE
 let firebaseDateFormatter = DateFormatter()

firebaseDateFormatter.timeZone = TimeZone(identifier: "UTC")
firebaseDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

/*
 Swift’s Date struct conforms to both Equatable and Comparable, which means you check two dates for equality and compare them to see which is earlier.

 In practice, this means you can use <, >, and == to compare them just like you would do with strings and integers. Try this in a playground:
 */

let now = Date()
let soon = Date().addingTimeInterval(5000)

now == soon
now != soon
now < soon
now > soon

Text(Date()...Date().addingTimeInterval(600))

// show just the date
Text(Date().addingTimeInterval(600), style: .date)

// show just the time
Text(Date().addingTimeInterval(600), style: .time)

// show the relative distance from now, automatically updating
Text(Date().addingTimeInterval(600), style: .relative)

// make a timer style, automatically updating
Text(Date().addingTimeInterval(600), style: .timer)


//First, this converts a Date to a short date string using dateStyle

let today = Date()
let formatter1 = DateFormatter()
formatter1.dateStyle = .short
print(formatter1.string(from: today))

//Second, this converts the same date to a medium time string using timeStyle:

let formatter2 = DateFormatter()
formatter2.timeStyle = .medium
print(formatter2.string(from: today))

//this converts the same date to a date and time string using a custom date format:
let formatter3 = DateFormatter()
formatter3.dateFormat = "HH:mm E, d MMM y"
print(formatter3.string(from: today))

//this attempts to convert a string to a date
let string = "20:32 Wed, 30 Oct 2019"
let formatter4 = DateFormatter()
formatter4.dateFormat = "HH:mm E, d MMM y"
print(formatter4.date(from: string) ?? "Unknown date")

/*
 Encoding and decoding dates using the Codable protocol isn’t hard to do, but it does produce some unexpected data by default: Date stores its information as a floating-point number counting the number of seconds since January 1st 2001, rather than something standard involved days, months, and years.

 ISO-8601 is the web’s standard way of referring to dates and times, and looks like this: 2018-12-25T17:30:00Z – in English that’s December 25th 2018, at 5:30pm UTC. Both JSONEncoder and JSONDecoder are able to use this date format rather than the floating-point default – all you have to do is set their dateEncodingStrategy and dateDecodingStrategy properties.


 */

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601

let encoder = JSONEncoder()
encoder.dateEncodingStrategy = .iso8601

let isoDate = "2018-12-26T13:48:05.000Z"

let isoDateFormatter = ISO8601DateFormatter()
isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
isoDateFormatter.formatOptions = [
    .withFullDate,
    .withFullTime,
    .withDashSeparatorInDate,
    .withFractionalSeconds]

if let realDate = isoDateFormatter.date(from: isoDate) {
    print("Got it: \(realDate)")
}

let isoDate2 = "20181226T134805Z"

func isodateFromString(_ isoDate: String) -> Date? {

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd'T'HHmmssZ"
    return formatter.date(from: isoDate)
}

let dateWeGot = isodateFromString(isoDate2)
print("Date We Got : \(dateWeGot)")
