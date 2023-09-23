#チーム開発　チームA　NaganoCake　ECサイト

## 概要
DWC生によるチーム開発課題です。

## 案件の背景

元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため
管理機能を含んだ通販サイトを開設しようと思い至った。

## 使用したGem

gem 'devise'
gem 'kaminari','~> 1.2.1'
gem 'pry-byebug', group: :development
gem 'enum_help  '

## **実装機能**

### 管理者側

-管理者ログイン、ログアウト
-商品の新規追加、編集、閲覧、販売停止（売切れ表示）
-商品ジャンルの追加、編集
-会員登録されているユーザー情報の閲覧、編集、退会処理
-全てのユーザーの注文履歴閲覧
-ユーザーごとの注文履歴閲覧
-注文・製造ステータス変更

### 顧客(会員)側

-会員新規登録
-会員情報の編集
-配送先の登録、編集、削除
-カートへの追加、商品購入
-支払い方法、配送先の指定
-注文履歴の閲覧
-ジャンル検索機能

##その他(共通機能)
-商品検索機能

## 使用方法

 $git clone git@github.com:A4-danshi/nagano_cake_EC.git
 $cd ディレクトリ
 $rails db:migrate
 $rails db:seed
 $yarn install
 $bundle install
 $yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object
 $rails s