//
//  ListAssetsCommand.swift
//
//
//  Created by Kenneth Endfinger on 10/23/21.
//

import ArgumentParser
import Foundation

struct ListAssetsCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "list-assets",
        abstract: "List assets inside the cache."
    )

    @Flag(name: .customShort("j"), help: "Enable JSON Output")
    var json: Bool = false

    func run() throws {
        for asset in try AssetCacheCommand.cache!.listAllAssets() {
            if json {
                print(String(data: try JSONEncoder().encode(asset), encoding: .utf8)!)
            } else {
                print("\(asset.guid) namespace=\(asset.namespace ?? "default") index=\(asset.index ?? "unknown") uri=\(asset.uri)")
            }
        }
    }
}