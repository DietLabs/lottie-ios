//
//  AnimationImageProvider.swift
//  Lottie_iOS
//
//  Created by Alexandr Goncharov on 07/06/2019.
//

import UIKit

/**
 Text provider is a protocol that is used to supply text to `AnimationView`.
 */
public protocol AnimationTextProvider: AnyObject {
    func textFor(keypathName: String, sourceText: String) -> String
    func customFontFor(keypathName: String, sourceFontName: String, size: Double) -> UIFont?
}

/// Text provider that simply map values from dictionary
public final class DictionaryTextProvider: AnimationTextProvider {
    
    public init(_ values: [String: String]) {
        self.values = values
    }
    
    let values: [String: String]
    
    public func textFor(keypathName: String, sourceText: String) -> String {
        return values[keypathName] ?? sourceText
    }
    
    public func customFontFor(keypathName: String, sourceFontName: String, size: Double) -> UIFont? {
        return nil
    }
}

/// Default text provider. Uses text in the animation file
public final class DefaultTextProvider: AnimationTextProvider {
    public func textFor(keypathName: String, sourceText: String) -> String {
        return sourceText
    }
    
    public func customFontFor(keypathName: String, sourceFontName: String, size: Double) -> UIFont? {
        return nil
    }
    
    public init() {}
}

