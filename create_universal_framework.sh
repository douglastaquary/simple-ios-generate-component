#!/bin/sh

UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-universal
suffix="Example/Pods"
CUSTOM_PROJECT_DIR=${PROJECT_DIR%"$suffix"}

exec > /tmp/${PRODUCT_NAME}_archive.log 2>&1

if [ "true" == ${ALREADYINVOKED:-false} ]
then
echo "RECURSION: Detected, stopping"
else
export ALREADYINVOKED="true"

UNIVERSAL_OUTPUTFOLDER=${BUILD_DIR}/${CONFIGURATION}-iosuniversal

# make sure the output directory exists
mkdir -p "${UNIVERSAL_OUTPUTFOLDER}"
rm -r "${CUSTOM_PROJECT_DIR}/${FULL_PRODUCT_NAME}"

echo "Building for iPhoneSimulator"
xcodebuild -workspace "${WORKSPACE_PATH}" -scheme "${TARGET_NAME}" -configuration ${CONFIGURATION} -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 11' ONLY_ACTIVE_ARCH=NO ARCHS='i386 x86_64' BUILD_DIR="${BUILD_DIR}" BUILD_ROOT="${BUILD_ROOT}" ENABLE_BITCODE=NO OTHER_CFLAGS="-fembed-bitcode" BITCODE_GENERATION_MODE=bitcode clean build

echo "Copying to output folder"
cp -R "${ARCHIVE_PRODUCTS_PATH}${INSTALL_PATH}/" "${UNIVERSAL_OUTPUTFOLDER}/"

echo "Combining executables"
lipo -create -output "${UNIVERSAL_OUTPUTFOLDER}/${EXECUTABLE_PATH}" "${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}/${EXECUTABLE_PATH}" "${ARCHIVE_PRODUCTS_PATH}${INSTALL_PATH}/${EXECUTABLE_PATH}"


echo "Convenience step to copy the framework to the project's directory"
yes | cp -Rf "${UNIVERSAL_OUTPUTFOLDER}/${FULL_PROJECT_NAME}" "${CUSTOM_PROJECT_DIR}"
rm -rf -- "${UNIVERSAL_OUTPUTFOLDER/${FULL_PROJECT_NAME}}"

#Fix Me! Copy generated header to framrwork
#This is Apple lipo bug
cp -R "${PROJECT_DIR}/temp/${TARGET_NAME}-Swift.h" "${CUSTOM_PROJECT_DIR}/${TARGET_NAME}.framework/Headers/${TARGET_NAME}-Swift.h"
echo "Copy to "
echo "${CUSTOM_PROJECT_DIR}/${TARGET_NAME}.framework/Headers/${TARGET_NAME}-Swift.h"

#Delete temporary files
echo "====== Deleting temporary files ====="
rm -rf "${PRODUCT_DIR}/tmp"
echo "====== Temporary files deleted"

open "${CUSTOM_PROJECT_DIR}"

echo "end"
fi