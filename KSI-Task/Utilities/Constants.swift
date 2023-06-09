//
//  Constants.swift
//  Leedo
//
//  Created by eslam dweeb on 21/09/2022.
//

import Foundation

enum ValidationErr:String {
    case notValidEmail       = "Please enter valid email address"
    case notValidPassword    = "Please enter valid password"
    case notValidUsername    = "Please enter valid user name"
    case notValidFullname    = "Please enter valid Fullname"
    case notValidConfirmPass = "Please enter valid confirm password"
    case notValidInput       = "Please ente valid email and password"
    case notValidInputs      = "Please enter Valid data"
}
enum EmptyFieldsErrorMessage:String {
    case AllFieldEmpty        = "All are required."
    case EmptyEmail           = "Please enter your email."
    case EmptyPassword        = "Please enter your password."
    case EmptyNewPassword     = "Please enter your new password."
    case EmptyOldPassword     = "Please enter your old password."
    case EmptyName            = "Please enter your name."
    case EmptyFirstName       = "Please enter your first name."
    case EmptyCurrentMilleage = "Please enter Current Milleag."
    case EmptyLicencePlat     = "Please enter Licence Plat."
    case EmptyLastName        = "Please enter your last name."
    case EmptyConfirmPassword = "Please enter confirm password."
    case EmptyPhone           = "Please enter your phone."
    case EmptyPhoneCode       = "Please enter your phone code."
    case EmptyBody            = "Please enter your message"
    case EmptySubject         = "Please enter your message subject"
}

enum Constants:String{
    case baseUrl        = "https://run.mocky.io/v3"
    case acceptType     = "Accept"
    case acceptLang     = "Accept-Language"
    case contentType    = "Content-Type"
    case acceptEncoding = "Accept-Encoding"
    case json           = "application/json"
    case authentication = "Authorization"
    case form           = "multipart/form-data"
    case token          = "Bearer"
    case userToken      = "userToken"
    case userName       = "userName"
    case userEmail      = "userEmail"
    case userId         = "userId"
    case userPhone      = "userPhone"
    case userSlug       = "userSlug"
    case isLogin        = "isLogin"
    case service        = "userData"
    case account        = "wkalat.com"
    case fcmToken       = "fcmToken"
    case firstTime      = "firstTime"
}
struct ElementKind {
    static let badge = "badge-element-kind"
    static let background = "background-element-kind"
    static let sectionHeader = "section-header-element-kind"
    static let sectionFooter = "section-footer-element-kind"
    static let layoutHeader = "layout-header-element-kind"
    static let layoutFooter = "layout-footer-element-kind"
}
enum SortFilterType {
    case lowToHight
    case highToLow
}

enum FontName:String {
    case Inter
    case Montserrat
}
