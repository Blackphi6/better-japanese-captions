# Better Japanese Captions

YouTube の日本語字幕の改行を、ブラウザ内で読みやすく整える Chrome 拡張機能です。

## インストール

- **Chrome ウェブストア**で「Better Japanese Captions」を検索してインストール（推奨）
- または [Releases](https://github.com/Blackphi6/better-japanese-captions/releases) の **Assets** から `BetterJapaneseCaptions-<version>.zip` をダウンロード（ストア用パッケージ）

## 使い方

- 対象: `youtube.com` / `www.youtube.com` / `m.youtube.com`
- プレーヤー横のトグルで、読みやすい改行の **オン / オフ** を切り替え
- キーボードショートカット（既定 `Alt+Shift+C`）でも同じ切り替えが可能。割り当ては `chrome://extensions/shortcuts` で変更

字幕の処理はすべてブラウザ内で行い、開発者サーバーへ字幕を送ることはありません。

## プライバシー

[Privacy Policy](https://blackphi6.github.io/better-japanese-captions/privacy-policy.html)

## 開発者向け（ソースから試す）

1. このリポジトリをクローン
2. Chrome の `chrome://extensions` → **デベロッパーモード** → **パッケージ化されていない拡張機能を読み込む** → リポジトリのルートフォルダを選択
3. コードを変更したら拡張の **更新** をクリック

ZIP の再生成: `bash scripts/package-extension.sh`

## フィードバック

[Issues](https://github.com/Blackphi6/better-japanese-captions/issues)
