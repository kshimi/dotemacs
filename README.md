# Modern Emacs Configuration for Apple Silicon Mac

Apple Silicon (M1/M2/M3) Mac での利用に最適化した、クリーンでモダンな Emacs 設定テンプレートです。
複雑な設定フレームワーク（Doom や Spacemacs）を使わず、Emacs 29+ の標準機能と厳選されたモダンなパッケージを組み合わせることで、**軽量・高速・メンテナンス性**の両立を目指しています。

---

## ✨ コンセプト

- **Simple & Modular**: 全ての設定を `conf/` 配下に分割。何がどこに書いてあるか一目でわかります。
- **Mac Native Experience**: macOS 標準のインライン日本語入力や、Command キーを Meta としたキーバインド、PlemolJP フォントによる美しい表示。
- **Modern Completion**: Vertico + Orderless + Consult を採用し、直感的で強力な検索・補完体験を提供。
- **Ready for Development**: Magit, vterm, Project.el など、エンジニアに必須のツールを最適化して導入。

## 📸 スクリーンショット / 外観

- **Theme**: [iceberg.vim](https://cocopon.github.io/iceberg.vim/) (Iceberg Theme)
- **Font**: [PlemolJP Console](https://github.com/yuru7/PlemolJP)
- **Transparency**: Emacs 29 の `alpha-background` を活用した、文字の視認性を損なわない背景透過。

## 🛠 前提条件

この設定をフルに活用するには、以下の環境を推奨します。

- **Emacs 29.1 以上**: `use-package` や透過設定などの標準機能を利用。
  - macOS の場合、`emacs-plus` または `emacs-mac` を推奨。
- **Font**: `PlemolJP Console`
- **System Tools**:
  - `cmake` (vterm のビルドに必要)
  - `ripgrep` (consult-grep で高速検索するために必要)

```bash
# macOS での推奨インストール例
brew tap d12frosted/emacs-plus
brew install emacs-plus@29 --with-native-comp
brew install cmake ripgrep
```

## 📦 導入方法

1. 既存の設定をバックアップ：
   ```bash
   mv ~/.emacs.d ~/.emacs.d.bak
   ```
2. このリポジトリをクローン：
   ```bash
   git clone https://github.com/YOUR_USERNAME/emacs-d.git ~/.emacs.d
   ```
3. Emacs を起動すると、初回に自動で全パッケージのダウンロードとインストールが始まります。

## 📂 ディレクトリ構成とモジュール

設定は `conf/` ディレクトリ内で番号順に読み込まれます。

```text
.emacs.d/
├── init.el             # エントリポイント。パッケージ管理と conf/ の読み込み
└── conf/
    ├── 01-display-mac  # 外観、フォント、テーマ、透過設定
    ├── 02-editing      # インデント、括弧、基本挙動
    ├── 03-mac          # macOS 固有のキーバインド、IME 連携
    ├── 04-completion   # Vertico/Consult 等のモダン補完
    ├── 11-magit        # Git 操作 (Magit)
    └── 14-vterm        # 高速ターミナル (vterm)
```

## ⌨️ 主なキーバインド

| キー | 機能 |
|:--- |:--- |
| `C-x g` | Magit Status (Git 操作) |
| `C-x b` | Consult Buffer (プレビュー付きバッファ切り替え) |
| `M-s l` | Consult Line (ファイル内高速検索) |
| `M-x vterm` | ターミナル起動 |

---

## 📝 ライセンス

[MIT License](LICENSE)

## 🤝 コントリビューション

自分好みの設定の参考にしたり、Fork して独自の環境を構築するベースとしてお使いください。改善の提案やバグ報告も歓迎します。
