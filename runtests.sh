#!/bin/sh
xcodebuild  -workspace PlayWithTravis.xcworkspace \
            -scheme PlayWithTravis \
            -sdk iphonesimulator9.0 \
            -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.0' \
            test 

#| xcpretty --test --color
