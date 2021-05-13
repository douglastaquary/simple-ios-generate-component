exec >> /tmp/${PROJECT_NAME}_archive.log 2>&1

FRAMEWORK_NAME="YOUR-FRAMEWORK-NAME"

cd ${SRCROOT}/Pods/${FRAMEWORK_NAME}/

echo "🚀restore ${SRCROOT}/Pods/${FRAMEWORK_NAME}"
rm -rf ./${FRAMEWORK_NAME}.framework
unzip -o ${FRAMEWORK_NAME}.zip
rm -rf ${FRAMEWORK_NAME}.zip
