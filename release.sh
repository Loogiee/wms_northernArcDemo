#!/bin/bash

echo "Enter tag:"
read tag
echo "Enter Release Body:"
read body
echo "git access token:"
read token
GITEA_URL="https://git.kfintech.com"
REPO_OWNER="KFintech"
REPO_NAME="wms_report"
GITEA_TOKEN="$token"
VERSION_TAG="v$tag"
RELEASE_NAME="Release v$tag NorthernArc"
RELEASE_BODY="$body"
TARGET_COMITISH=$(git rev-parse HEAD)
OS=("linux" "windows")
ARCHS=("amd64" "arm64")

echo "Creating release on Gitea..."

RELEASE_RESPONSE=$(curl -X 'POST' \
  "$GITEA_URL/api/v1/repos/$REPO_OWNER/$REPO_NAME/releases" \
  -H 'accept: application/json' \
  -H "Authorization: token $GITEA_TOKEN" \
  -H 'Content-Type: application/json' \
  -d "{
    \"body\": \"$RELEASE_BODY\",
    \"draft\": false,
    \"name\": \"$RELEASE_NAME\",
    \"prerelease\": true,
    \"tag_name\": \"$VERSION_TAG\",
    \"target_commitish\": \"$TARGET_COMITISH\"
  }")
# Check if the release was created successfully
if echo "$RELEASE_RESPONSE" | grep -q "id"; then
  echo "Release created successfully!"
else
  echo "Error creating release:"
  echo "$RELEASE_RESPONSE"
  exit 1
fi

# Step 2: Upload the binary file to the created release
# Extract the release ID from the response
ID=$(echo "$RELEASE_RESPONSE" | grep -o '"id":[0-9]*' | head -n 1 | sed 's/"id"://')
echo "Release ID is: $ID"
# echo "Uploading binary file to Gitea release..."

#build and Upload the binary file to the release
LOCAL_FILE_PATH=$PWD

# for os in "${OS[@]}"; do
  for arch in "${ARCHS[@]}"; do

    BINARY_NAME="wms-windows-${arch}"
    OUTPUT_PATH="${LOCAL_FILE_PATH}/${BINARY_NAME}"

    # Step 1: Cross-compile the Go binary for the specified OS and architecture
    echo "Building binary for $os-$arch..."
    GOOS=windows GOARCH=$arch go build -o "$OUTPUT_PATH"

    # Step 2: Upload the binary to Gitea
    echo "Uploading $BINARY_NAME to Gitea..."

    UPLOAD_RESPONSE=$(
      curl -s -X POST \
      -H "Content-Type: multipart/form-data" \
      -H "Authorization: token $GITEA_TOKEN" \
      -F "attachment=@$OUTPUT_PATH" \
      "$GITEA_URL/api/v1/repos/$REPO_OWNER/$REPO_NAME/releases/$ID/assets?name=$BINARY_NAME"
    )

    # Check if the upload was successful
    if echo "$UPLOAD_RESPONSE" | grep -q "id"; then
      echo "Binary $BINARY_NAME uploaded successfully!"
    else
      echo "Error uploading binary $BINARY_NAME:"
      echo "Err - $UPLOAD_RESPONSE"
      exit 1
    fi
  done
# done

# UPLOAD_RESPONSE=$(
#     curl -X POST \
#   -H 'Content-Type: multipart/form-data' \
#   -F "attachment=@$LOCAL_FILE_PATH" \
#   "https://git.kfintech.com/api/v1/repos/KFintech/wms_report/releases/$ID/assets?access_token=8e66542e1f8ac1c62aa4837df48fab28e5601cc6"
# )

echo "Release process completed successfully!"