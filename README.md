# Modern Emacs Configuration (macOS / Windows / WSL2)

macOS (Apple Silicon)、Windows ネイティブ、および WSL2 での利用に最適化した、クリーンでモダンな Emacs 設定テンプレートです。
Emacs 29+ の標準機能と厳選されたモダンなパッケージを組み合わせ、**軽量・高速・メンテナンス性**の両立を目指しています。

---

## 特徴

- **マルチプラットフォーム対応**: macOS, Windows (Native), WSL2 の各環境を自動判別し、最適な設定（IME、フォント、キーバインド）を適用します。
- **Simple & Modular**: 全ての設定を `conf/` 配下に分割。OS 固有の設定と共通設定が明確に分離されています。
- **Modern Completion**: Vertico + Orderless + Consult を採用。高速で直感的なミニバッファ補完を提供します。
- **Ready for Development**: Magit, vterm, Project.el など、開発に必要なツールを最適化して導入済み。
- **Beautiful UI**: Iceberg テーマと PlemolJP フォントによる、視認性が高く美しいコーディング環境。

## 外観 / デザイン

- **Theme**: [iceberg.vim](https://cocopon.github.io/iceberg.vim/) (Iceberg Theme)
- **Font**: [PlemolJP Console](https://github.com/yuru7/PlemolJP)

## 前提条件

- **Emacs 29.1 以上**: `use-package` や透過設定などの標準機能を利用。
- **Font**: `PlemolJP Console` (推奨)
- **Common Tools**: `ripgrep` (consult-grep 等での高速検索に必要)

### macOS
- `emacs-plus` または `emacs-mac` を推奨。
```bash
brew tap d12frosted/emacs-plus
brew install emacs-plus@29 --with-native-comp
brew install cmake ripgrep
```

### Windows (Native)
- [GNU Emacs 公式バイナリ](https://www.gnu.org/software/emacs/download.html#windows) または winget でのインストールを推奨。
```powershell
winget install --id GNU.Emacs -e --source winget
winget install --id Git.Git -e --source winget
winget install --id BurntSushi.ripgrep.MSVC -e --source winget
```

### WSL2 (Ubuntu 等)
```bash
sudo apt update && sudo apt install emacs ripgrep cmake
```

## 導入方法

1. 既存の設定をバックアップ：
   ```bash
   mv ~/.emacs.d ~/.emacs.d.bak
   ```
2. このリポジトリをクローン：
   ```bash
   git clone https://github.com/YOUR_USERNAME/emacs-d.git ~/.emacs.d
   ```
3. Emacs を起動すると、初回に自動でパッケージのダウンロードとインストールが始まります。

## ディレクトリ構成

設定は `conf/` 内のファイルが順次ロードされます。

```text
.emacs.d/
├── init.el             # エントリポイント。パッケージ管理とロード設定
└── conf/
    ├── 01-display      # 外観、共通フォント、テーマ、透過設定
    ├── 02-editing      # 基本挙動、編集支援
    ├── 03-mac          # macOS 固有（Commandキー、IME連携等）
    ├── 03-windows      # Windows/WSL2 固有（IME、WSLクリップボード等）
    ├── 04-completion   # Vertico/Consult 等のモダン補完
    ├── 05-whichkey     # キーバインドのガイド表示
    ├── 11-magit        # Git 操作 (Magit)
    └── 14-vterm        # 高速ターミナル (vterm)
```

##  主なキーバインド

| キー | 機能 |
|:--- |:--- |
| `C-x g` | Magit Status (Git 操作) |
| `C-x b` | Consult Buffer (プレビュー付きバッファ切り替え) |
| `M-s l` | Consult Line (ファイル内検索) |
| `M-s r` | Consult Ripgrep (プロジェクト内高速検索) |
| `M-x vterm` | ターミナル起動 |

---

## ライセンス

[MIT License](LICENSE)
