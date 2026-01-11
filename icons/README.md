# PWAアイコンについて

このディレクトリには、PWA（Progressive Web App）用のアイコン画像を配置してください。

## 必要なアイコンサイズ

以下のサイズのPNG画像が必要です：

- icon-72x72.png
- icon-96x96.png
- icon-128x128.png
- icon-144x144.png
- icon-152x152.png
- icon-192x192.png
- icon-384x384.png
- icon-512x512.png

## アイコン生成方法

### オプション1: オンラインツールを使用

1. [PWA Asset Generator](https://www.pwabuilder.com/imageGenerator) にアクセス
2. 元画像（512x512px以上推奨）をアップロード
3. 生成されたアイコンをダウンロードして、このディレクトリに配置

### オプション2: 手動で作成

元となるアイコン画像（例：app-icon.png）から、各サイズのアイコンを生成します。

ImageMagickを使用する場合：

```bash
# 各サイズのアイコンを生成
for size in 72 96 128 144 152 192 384 512; do
  convert app-icon.png -resize ${size}x${size} icons/icon-${size}x${size}.png
done
```

### オプション3: 簡易SVGアイコン（開発用）

開発段階では、SVGアイコンを使用することもできます。

## 現在の状態

現在、このディレクトリにはプレースホルダーのSVGアイコンが配置されています。
本番環境では、適切なPNG画像に置き換えてください。
