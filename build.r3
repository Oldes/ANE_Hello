;;   ____  __   __        ______        __
;;  / __ \/ /__/ /__ ___ /_  __/__ ____/ /
;; / /_/ / / _  / -_|_-<_ / / / -_) __/ _ \
;; \____/_/\_,_/\__/___(@)_/  \__/\__/_// /
;;  ~~~ oldes.huhuman at gmail.com ~~~ /_/
;;
;; SPDX-License-Identifier: Apache-2.0

Rebol [
	title:   "Build Hello.ane"
	purpose: "Build Hello AIR native extension"
	needs: 3.16.0 ;; https://github.com/Oldes/Rebol3/releases/tag/3.16.0
]
import airsdk

make-dir %build/

air-task
"Compile HelloExtension SWC" [
	compc [
		-swf-version     33
		-source-path     %platform/actionscript/src
		-include-classes %tech.oldes.hello.HelloExtension
		-output          %build/tech.oldes.hello.swc
	]
]

air-task
"Compile Android natives" [
	cd %platform/android
	eval %gradlew [clean build]
	print as-green "Lint results:"
	print read/string %app/build/reports/lint-results-debug.txt
	cd %../..
	copy-file %platform/android/app/build/outputs/aar/app-release.aar %build/tech.oldes.hello.aar
]

air-task
"Compile HelloExtension ANE" [
	delete-file %build/tech.oldes.hello.ane
	build-ane [
		id:  @tech.oldes.hello
		initializer: @HelloExtension
		platforms: [Android-ARM Android-ARM64]
	]
]
