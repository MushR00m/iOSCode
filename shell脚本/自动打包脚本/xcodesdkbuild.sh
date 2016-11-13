#

# Script Attribution:

# http://db-in.com/blog/2011/07/universal-framework-iphone-ios-2-0/

#

# Modifications Copyright (c) 2012 Mocean Mobile.  All rights reserved.

#



# Sets the target folders and the final framework product.

PROJECT_NAME=JYDeviceManager

SRCROOT="/Users/songqi/Documents/Work/设备指纹/DeviceFingerprinting-IOS-SDK/JYDeviceFinger"

BUILD_CONFIGURATION=Debug


LIB_NAME=lib${PROJECT_NAME}.a

FMK_NAME=${PROJECT_NAME}

FMK_VERSION=A


# Install dir will be the final output to the framework.

# The following line create it in the root folder of the current project.

INSTALL_DIR=${SRCROOT}/Products/${FMK_NAME}.framework

# Working dir will be deleted after the framework creation.

WRK_DIR=build

DEVICE_DIR=${WRK_DIR}/${BUILD_CONFIGURATION}-iphoneos/

SIMULATOR_DIR=${WRK_DIR}/${BUILD_CONFIGURATION}-iphonesimulator/



# Cleaning the oldest.

rm -rf "${INSTALL_DIR}"



# # Building both architectures.

xcodebuild -configuration "${BUILD_CONFIGURATION}" -target "${FMK_NAME}" -sdk iphoneos

xcodebuild -configuration "${BUILD_CONFIGURATION}" -target "${FMK_NAME}" -sdk iphonesimulator



# # Creates and renews the final product folder.

mkdir -p "${INSTALL_DIR}"

mkdir -p "${INSTALL_DIR}/Versions"

mkdir -p "${INSTALL_DIR}/Versions/${FMK_VERSION}"

mkdir -p "${INSTALL_DIR}/Versions/${FMK_VERSION}/Headers"



# # Creates the internal links.

# # It MUST uses relative path, otherwise will not work when the folder is copied/moved.

ln -s "${FMK_VERSION}" "${INSTALL_DIR}/Versions/Current"

ln -s "Versions/Current/Headers" "${INSTALL_DIR}/Headers"

ln -s "Versions/Current/${FMK_NAME}" "${INSTALL_DIR}/${FMK_NAME}"



# # Copies the headers files to the final product folder.

cp -R "${DEVICE_DIR}" "${INSTALL_DIR}/Versions/${FMK_VERSION}/Headers/"



# # Uses the Lipo Tool to merge both binary files (i386 + armv6/armv7) into one Universal final product.

lipo -create "${DEVICE_DIR}/${LIB_NAME}" "${SIMULATOR_DIR}/${LIB_NAME}" -output "${INSTALL_DIR}/Versions/${FMK_VERSION}/${FMK_NAME}"



rm -r "${WRK_DIR}"




