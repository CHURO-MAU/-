#!/bin/bash

# PWAアイコン生成スクリプト
# 使用方法: ./generate-icons.sh <元画像ファイル>

if [ -z "$1" ]; then
  echo "使用方法: ./generate-icons.sh <元画像ファイル>"
  echo "例: ./generate-icons.sh my-icon.png"
  exit 1
fi

SOURCE_IMAGE="$1"

if [ ! -f "$SOURCE_IMAGE" ]; then
  echo "エラー: ファイル '$SOURCE_IMAGE' が見つかりません"
  exit 1
fi

# ImageMagickがインストールされているか確認
if ! command -v convert &> /dev/null; then
  echo "エラー: ImageMagickがインストールされていません"
  echo ""
  echo "インストール方法:"
  echo "  Ubuntu/Debian: sudo apt-get install imagemagick"
  echo "  macOS: brew install imagemagick"
  echo "  Windows: https://imagemagick.org/script/download.php"
  echo ""
  echo "または、オンラインツールを使用してください:"
  echo "  https://www.pwabuilder.com/imageGenerator"
  exit 1
fi

# 各サイズのアイコンを生成
SIZES=(72 96 128 144 152 192 384 512)

echo "アイコンを生成中..."

for size in "${SIZES[@]}"; do
  output_file="icon-${size}x${size}.png"
  echo "  生成中: $output_file"
  convert "$SOURCE_IMAGE" -resize ${size}x${size} -background none -gravity center -extent ${size}x${size} "$output_file"
done

echo ""
echo "✅ 完了! 以下のアイコンが生成されました:"
ls -lh icon-*.png

echo ""
echo "これらのファイルを icons/ ディレクトリに配置してください"
