//
//  HMSStreamingStates.swift
//  hmssdk_flutter
//
//  Created by Yogesh Singh on 20/12/21.
//

import Foundation
import HMSSDK

class HMSStreamingStateExtension {

    static func toDictionary(rtmp: HMSRTMPStreamingState) -> [String: Any] {
        var dict = [String: Any]()

        dict["running"] = rtmp.running
        if let startedAt = rtmp.startedAt {
            dict["started_at"] = Int(startedAt.timeIntervalSince1970 * 1000)
        }
        if let error = rtmp.error {
            dict.merge(HMSErrorExtension.toDictionary(error)) { (_, new) in new }
        }
        
        dict["state"] = rtmp.state.displayString().uppercased()
        return dict
    }

    static func toDictionary(server: HMSServerRecordingState) -> [String: Any] {

        var dict = [String: Any]()

        dict["running"] = server.running
        if let startedAt = server.startedAt {
            dict["started_at"] = Int(startedAt.timeIntervalSince1970 * 1000)
        }
        if let error = server.error {
            dict.merge(HMSErrorExtension.toDictionary(error)) { (_, new) in new }
        }
        
        dict["state"] = server.state.displayString().uppercased()
        return dict
    }

    static func toDictionary(browser: HMSBrowserRecordingState) -> [String: Any] {

        var dict = [String: Any]()

        dict["initialising"] = browser.initialising

        dict["running"] = browser.running
        if let startedAt = browser.startedAt {
            dict["started_at"] = Int(startedAt.timeIntervalSince1970 * 1000)
        }
        if let error = browser.error {
            dict.merge(HMSErrorExtension.toDictionary(error)) { (_, new) in new }
        }

        dict["state"] = browser.state.displayString().uppercased()
        return dict
    }

    static func toDictionary(hlsStreaming: HMSHLSStreamingState) -> [String: Any] {
        var dict = [String: Any]()

        dict["running"] = hlsStreaming.running
        var args = [Any]()
        hlsStreaming.variants.forEach { variant in
            args.append(HMSHLSVariantExtension.toDictionary(variant))
        }
        dict["variants"]=args

        dict["state"] = hlsStreaming.state.displayString().uppercased()
        return dict
    }

    static func toDictionary(hlsRecording: HMSHLSRecordingState) -> [String: Any] {
        var dict = [String: Any]()

        dict["running"] = hlsRecording.running
        if let startedAt = hlsRecording.startedAt {
            dict["started_at"] = Int(startedAt.timeIntervalSince1970 * 1000)
        }
        if let error = hlsRecording.error {
            dict.merge(HMSErrorExtension.toDictionary(error)) { (_, new) in new }
        }

        dict["state"] = hlsRecording.state.displayString().uppercased()
        return dict
    }
}
