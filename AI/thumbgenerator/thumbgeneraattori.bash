#!/bin/bash

# Thumbnail Generator
# Creates thumbnail images and an HTML index from JPG/PNG files in current directory

set -euo pipefail

# Get list of image files, excluding thumbnails
getImageFiles() {
    find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" \) ! -iname "small_*" -printf "%f\n" | sort
}

# Create thumbnail from image file
createThumbnail() {
    local imageFile="$1"
    local thumbFile="small_${imageFile}"

    # Create thumbnail maintaining original orientation, no rotation
    convert "${imageFile}" -auto-orient -thumbnail 450x450 -strip "${thumbFile}"
}

# Get file modification date, time, weekday, and size
getFileDate() {
    local imageFile="$1"
    local dateTime=$(stat -c "%y" "${imageFile}" | cut -d'.' -f1)
    local weekday=$(date -d "$(stat -c "%y" "${imageFile}")" +"%a")
    local fileSize=$(stat -c "%s" "${imageFile}")
    local fileSizeKb=$((fileSize / 1024))

    echo "${weekday} ${dateTime} (${fileSizeKb} kB)"
}

# Generate HTML header with embedded CSS
generateHtmlHeader() {
    cat << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Gallery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 10px;
            background-color: #f5f5f5;
        }
        .gallery {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            max-width: 1000px;
            margin: 0 auto;
        }
        .gallery-item {
            background: white;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-align: center;
        }
        .gallery-item img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto;
        }
        .file-date {
            font-size: 1.0em;
            color: #666;
            margin-top: 8px;
        }
    </style>
</head>
<body>
    <div class="gallery">
EOF
}

# Generate HTML gallery item
generateGalleryItem() {
    local imageFile="$1"
    local thumbFile="small_${imageFile}"
    local fileDate=$(getFileDate "${imageFile}")

    cat << EOF
        <div class="gallery-item">
            <a href="${imageFile}">
                <img src="${thumbFile}" alt="${imageFile}">
            </a>
            <div class="file-date">${fileDate}</div>
        </div>
EOF
}

# Generate HTML footer
generateHtmlFooter() {
    cat << 'EOF'
    </div>
</body>
</html>
EOF
}

# Check if required commands are available
checkDependencies() {
    if ! command -v convert &> /dev/null; then
        echo "Error: ImageMagick 'convert' command not found. Please install ImageMagick." >&2
        exit 1
    fi
}

# Main execution
main() {
    local htmlFile="index.html"

    # Verify dependencies
    checkDependencies

    # Start HTML file
    generateHtmlHeader > "${htmlFile}"

    # Process each image file
    while IFS= read -r imageFile; do
        echo "Processing: ${imageFile}"
        createThumbnail "${imageFile}"
        generateGalleryItem "${imageFile}" >> "${htmlFile}"
    done < <(getImageFiles)

    # Close HTML file
    generateHtmlFooter >> "${htmlFile}"

    echo "Gallery created: ${htmlFile}"
}

main
