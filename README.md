This project was originally an isolated reproduction of Swift Godot issue [#320](https://github.com/migueldeicaza/SwiftGodot/issues/320)

Now it serves as a reference point for a proper solution to using Godot resources, specifically .tscn files based on your SwiftGodot types provided via .gdextension

Overall:
1. make a .pck file
2. copy that into a `Resources` folder
3. pass that when calling `runGodot` from your `SwiftGodotKit` executable target

this should work with sprites and other things too.
