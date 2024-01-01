all: build remove deploy

build:
	echo "going to build the package"
	swift build -j 8

remove:
	echo "remove the existing libraries from res://bin"
	rm ./Sources/MyGame/Project/bin/libSwiftGodot.dylib
	rm ./Sources/MyGame/Project/bin/libMyLibrary.dylib

deploy:
	echo "deploy the new libraries to res://bin"
	cp .build/debug/libSwiftGodot.dylib ./Sources/MyGame/Project/bin
	cp .build/debug/libMyLibrary.dylib ./Sources/MyGame/Project/bin
