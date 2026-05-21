# Better Japanese Captions

YouTube の日本語字幕の改行を、ブラウザ内で読みやすく整える Chrome 拡張機能です。（Budoux 相当のモデルを同梱）

**配布 ZIP（ストア用ビルド）:** [Releases](https://github.com/Blackphi6/better-japanese-captions/releases) の **Assets** から `BetterJapaneseCaptions-<version>.zip` をダウンロードできます。

## リリース時（ストアアップデートと GitHub）

**拡張をストアへアップデートしたタイミングでは、ソースも GitHub に揃える。**

1. `manifest.json` の `version` を上げた内容をすべてコミットし、`git push` する。
2. `bash scripts/package-extension.sh` で `release/BetterJapaneseCaptions-<version>.zip` を生成し、Chrome ウェブストアにアップロードする。
3. **GitHub Releases に同じ ZIP を載せる**（右サイドバーの Releases からダウンロード可能にする）:

   ```bash
   bash scripts/publish-github-release.sh
   ```

   初回は [GitHub CLI](https://cli.github.com/) の `gh auth login` が必要です。同じ `v<version>` のリリースが既にあると失敗するので、そのときは Web から該当 Release を削除するか、バージョンを上げてから再実行してください。

掲載説明・権限の説明文などのコピペ用メモはローカルのみ `STORE_SUBMISSION.txt` に置く（Git では追跡しない）。

## GitHub のリポジトリを作り直す（履歴を消して同じ名前で載せ直す）

手順は [`docs/GITHUB_REPO_RESET.md`](docs/GITHUB_REPO_RESET.md)。**CLI で `gh repo delete` するには** `gh auth refresh -h github.com -s delete_repo` が必要な場合があります。削除できないときは GitHub の **Settings → Danger zone** から削除してください。

## ローカルで試す

1. Chrome で `chrome://extensions` → 「デベロッパーモード」→ 「パッケージ化されていない拡張機能を読み込む」→ このフォルダを選択。
2. 変更後は「更新」または拡張の再読み込み。

## 関連

- ショートカットの変更: `chrome://extensions/shortcuts`
