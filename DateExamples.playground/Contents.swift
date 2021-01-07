import UIKit

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





