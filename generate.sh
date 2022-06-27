SWIFT_MODULE_SRC="./NetworkLayer/Sources/NetworkLayer/"
openapi-generator generate -i "openapi.yaml" -g swift5 -o "jikan-api"
rm -r $SWIFT_MODULE_SRC""*
cp -R "jikan-api/OpenAPIClient/Classes/OpenAPIs/". $SWIFT_MODULE_SRC
rm -r "jikan-api"
