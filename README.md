# Better Japanese Captions

YouTube の日本語字幕の改行を、ブラウザ内で読みやすく整える Chrome 拡張機能です。（Budoux 相当のモデルを同梱）

## リリース時（ストアアップデートと GitHub）

**拡張をストアへアップデートしたタイミングでは、ソースも GitHub に揃える。**

1. `manifest.json` の `version` を上げた内容をすべてコミットする。
2. `bash scripts/package-extension.sh` で `release/BetterJapaneseCaptions-<version>.zip` を生成し、それをウェブストアにアップロードする。
3. コミットをリモート（GitHub）へプッシュする。必要ならタグを打つ（例: `git tag v1.0.7 && git push origin v1.0.7`）。

プライバシー権限文言などは `STORE_SUBMISSION.txt` を参照。

## ローカルで試す

1. Chrome で `chrome://extensions` → 「デベロッパーモード」→ 「パッケージ化されていない拡張機能を読み込む」→ このフォルダを選択。
2. 変更後は「更新」または拡張の再読み込み。

## 関連

- ショートカットの変更: `chrome://extensions/shortcuts`
