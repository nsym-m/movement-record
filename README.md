# MovementRecord

アクティビティを記録・発信できるアプリ
Twitterに投稿も可能

## 機能

### 腕立て伏せ

腕立て伏せの回数を記録する。

### 散歩

散歩に出る時に歩数と距離を記録する。

## 画面

### ホーム

機能一覧の画面
機能のリスト（腕立て伏せと散歩）が表示され選択することでその画面が開かれる

### 腕立て伏せ

startで腕立て伏せの測定を開始する
stopで測定終了
回数が表示され、記録される
ツイートするボタンがありそこからツイートできる

### 散歩

startで歩数と移動距離測定開始
stopで測定終了
歩数と距離が表示される
ツイートするボタンがありそこからツイートできる

### 設定

iPhone側にある
Twitterと連携させる機能

Twitterとの連携のさせ方についてメモ
- iOS側
    - Twitterに開発者登録
    - TwitterKitを利用してログイン
    - ログイン情報をKeychainに保存しKeychain Sharingで共有可能にする
- watchOS側
    - watchOS側ではTwitterKitが使えない
    - watchOSからKeychainにアクセスして認証情報を取得してツイートをする方針
        - 参考
        - [iOSウィジェットから認証済みAPIリクエストを送信する方法](https://zenn.dev/u_motion/articles/3bd96be9d60b91)
        - [Sharing tokens between iOS, macOS and watchOS app using the iCloud KeyChain](https://damian.fyi/swift/2020/07/23/sharing-tokens-between-macos-ios-and-watchos-using-icloud-keychain.html)
        - [Access to Shared iOS Keychain with WatchOS](https://developer.apple.com/forums/thread/79866)
    - ツイートをするのは普通のTwitter APIへのリクエスト
