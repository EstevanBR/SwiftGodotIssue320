import Foundation
import MyLibrary
import SwiftGodot
import SwiftGodotKit

private func main() {
    guard let packPath = Bundle.module.path(forResource: "Resources/MyGame", ofType: "pck") else {
        fatalError("Could not load Pack")
    }

    runGodot(
        args: [
            "--main-pack", packPath
        ],
        initHook: registerTypes,
        loadScene: loadScene,
        loadProjectSettings: { projectSettings in
            print(projectSettings)
        },
        verbose: true
    )
}

private func loadScene (scene: SceneTree) {
    guard let root = scene.root else {
        fatalError("scene.root was nil")
    }

    guard let packedScene = GD.load(path: "Levels/my_level.tscn") as? PackedScene else {
        fatalError("Could not load PackedScene")
    }

    guard let node = packedScene.instantiate() else {
        fatalError("Could not instantiate packedScene")
    }

    guard let myLevel = node as? MyLevel else {
        fatalError("node as? MyLevel was nil; description: \(node.description)")
    }

    root.addChild(node: myLevel)
    guard let prettyTreeString = scene.root?.getTreeStringPretty() else {
        return
    }
    GD.printDebug(prettyTreeString)
    print(prettyTreeString)
}

private func registerTypes (level: GDExtension.InitializationLevel) {
    switch level {
    case .core: break
    case .servers: break
    case .scene:
        register(type: MyLevel.self)
    
    case .editor: break
    }
}

main()
