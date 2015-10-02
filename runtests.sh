#!/bin/sh
xcodebuild  -workspace PlayWithTravis.xcworkspace \
            -scheme PlayWithTravis \
            -sdk iphonesimulator9.1 \
            -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.1' \
            test | xcpretty --test --color
