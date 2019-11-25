//
//  LineSDKLoginManagerParameters.swift
//
//  Copyright (c) 2016-present, LINE Corporation. All rights reserved.
//
//  You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
//  copy and distribute this software in source code or binary form for use
//  in connection with the web services and APIs provided by LINE Corporation.
//
//  As with any software that integrates with the LINE Corporation platform, your use of this software
//  is subject to the LINE Developers Agreement [http://terms2.line.me/LINE_Developers_Agreement].
//  This copyright notice shall be included in all copies or substantial portions of the software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#if !LineSDKCocoaPods && !LineSDKXCFramework
import LineSDK
#endif

@objcMembers
public class LineSDKLoginManagerParameters: NSObject {
    
    var _value: LoginManager.Parameters
    
    public override init() {
        _value = LoginManager.Parameters()
    }
    
    init(_ value: LoginManager.Parameters) { _value = value }
    var unwrapped: LoginManager.Parameters { return _value }
    
    public var onlyWebLogin: Bool {
        get { _value.onlyWebLogin }
        set { _value.onlyWebLogin = newValue }
    }
    
    public var botPromptStyle: LineSDKLoginManagerBotPrompt? {
        get { _value.botPromptStyle.map(LineSDKLoginManagerBotPrompt.init) }
        set { _value.botPromptStyle = newValue?._value }
    }
    
    public var preferredWebPageLanguage: String? {
        get { _value.preferredWebPageLanguage?.rawValue }
        set { _value.preferredWebPageLanguage = newValue.map { .init(rawValue: $0) } }
    }
}

@objcMembers
public class LineSDKLoginManagerBotPrompt: NSObject {
    
    let _value: LoginManager.BotPrompt
    init(_ value: LoginManager.BotPrompt) { _value = value }
    
    public static let normal = LineSDKLoginManagerBotPrompt(.normal)
    public static let aggressive = LineSDKLoginManagerBotPrompt(.aggressive)
    
    public var rawValue: String { _value.rawValue }
}
