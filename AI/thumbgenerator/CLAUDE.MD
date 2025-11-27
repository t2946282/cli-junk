# Project: My thumbnail generator app

## Project Description

This tool creates a static HTML index.html document with thumbnail images from directory containing jpg and png images, ignoring earlier thumbnails in the same directory

## Tech Stack

- Frontend: Linux commandline tool written with Bash
- Database: none
- Testing: none

## Code Conventions

- camelCase for variables and functions
- PascalCase for components and classes
- 4-space indentation

## Project Structure

- Everything will be saved to the same project directory root

## Instructions for Claude

- Always prefer short and clear solution. Do not overengineer
- Prioritize performance optimizations
- Prefer functional programming approach
- Comment the code shortly

## Application requirements

- Must be a single file Bash script for Linux
- Uses ImageMagick package tools to create the thumbnails (450x450 pixels)
- Thumbnails maintain original orientation without rotation (using -auto-orient and -strip flags)
- Is executed without any command line parameters
- Reads directory listing for PNG and JPG files ignoring filenames starting small_
- Creates thumbnails from the JPG and PNG images
- Thumbnail images are saved with same name as the original image, but the filename begins with string small_
- Creates a index.html file which does not use Javascript and only embedded CSS showing thumbnail images in two columns
- Each thumbnail image must have descriptive text showing: weekday, date, time (24-hour format), and original file size in kB inside parentheses
- Example timestamp format: "Mon 2025-11-27 14:30:45 (2456 kB)"
- Thumbnail image is a link pointing to a full image in the same directory
- Checks for ImageMagick dependency before execution and shows error if missing
- HTML output has no headline, just the gallery grid
- CSS styling: 10px margins and gaps, 1000px max-width, white gallery items with rounded corners and shadows
