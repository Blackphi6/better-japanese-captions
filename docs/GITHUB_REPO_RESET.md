# GitHub リポジトリを作り直す（履歴削除・ソースは同じ）

**消えるもの**: Issues / PR / Discussions / Stars / リポジトリ設定（**GitHub Pages** の Pages 設定も要やり直し）。  
**同じ名前** `better-japanese-captions` で作り直せば URL はほぼ同じ（ストアの「ホームページ」リンクも維持しやすい）。

## A. Web から削除（確実）

1. [リポジトリ Settings](https://github.com/Blackphi6/better-japanese-captions/settings) → 一番下 **Danger Zone** → **Delete this repository**

## B. CLI から削除する場合

トークンに `delete_repo` が必要です。

```bash
gh auth refresh -h github.com -s delete_repo
gh repo delete Blackphi6/better-japanese-captions --yes
```

## 新規リポジトリへ「きれいな履歴」で載せる

ローカルのリポジトリ直下で（バックアップを取ってからでも可）:

```bash
rm -rf .git
git init
git branch -M main
git add .
git commit -m "Initial commit: Better Japanese Captions Chrome extension"

gh repo create Blackphi6/better-japanese-captions \
  --public \
  --source=. \
  --remote=origin \
  --push \
  --description "Chrome extension: cleaner Japanese caption line breaks on YouTube (Budoux)"

# GitHub Pages（プライバシーポリシーなど）を使っていた場合は Settings → Pages で再有効化
```

別マシンのときは `STORE_SUBMISSION.txt` は `.gitignore` のため自分でコピーするか、別管理にしてください。
