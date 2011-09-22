## What is this?
* 小･中規模な組織が
* パスワードを共有し
* 効率的に管理するための
* アプリケーション

## Who needs this?
* 組織内で、パスワードの共有･管理を一元化したい
* パスワードを暗号化してデータベースに保存したい
* できるだけシンプルなシステムを使いたい

## Overview

![overview](https://github.com/koyonote/password_app/raw/master/screenshot/overview.png "overview")

![overview2](https://github.com/koyonote/password_app/raw/master/screenshot/overview2.png "overview2")

## Demo
### Visit the [Demo Page](http://password-app.heroku.com/login "Demo")


#### manager

    login: demo-manager
    password: demo

#### employee

    login: demo-employee
    password: demo

## Usage

####0. 管理者を決める

####1. デプロイ
    1. ソースコードをダウンロード
    2. 解凍して適切なディレクトリへ移動
    3. config/database.yml.example をコピーして config/database.yml を作成
    4. データーベースの環境に応じて config/database.yml を編集（production環境）
    5. テーブル作成＆初期データ挿入
    6. 下記の初期ユーザー（adminロール）でログイン
      ログインID: foo
      パスワード: bar
    7. ログインID、パスワードを変更する
####2. 管理者（adminロール）がユーザー･グループを作成

![newuser](https://github.com/koyonote/password_app/raw/master/screenshot/newuser.png "newuser")

![newgroup](https://github.com/koyonote/password_app/raw/master/screenshot/newgroup.png "newgroup")

####3. admin/managerロールのユーザーがフォルダを作成していく

![newfolder](https://github.com/koyonote/password_app/raw/master/screenshot/newfolder.png "newfolder")

####4. フォルダへの閲覧を許されたユーザーらでアイテムを作成していき、共有開始

![newitem](https://github.com/koyonote/password_app/raw/master/screenshot/newitem.png "newitem")

## Features
####1. グループ

* グループは階層ではなくフラットな構造
* グループは必要なだけ作ることができ、フォルダにフィルタを掛ける際に威力を発揮する

####2. ユーザー

* ユーザーは複数のグループに属することができる

![user group](https://github.com/koyonote/password_app/raw/master/screenshot/user_group.jpg "user group")

* 各ユーザーは、3種のロールによって権限が異なる（詳しくは、ロールを参照下さい）

![user pyramid](https://github.com/koyonote/password_app/raw/master/screenshot/pyramid.jpg "user pyramid")

####3. ロール

##### 1. admin

               作成    編集    削除
    ------------------------------
    グループ     +       +      +
    ユーザー     +       +      +
    フォルダ     +       +      +
    アイテム     +       +      +

##### 2. manager

               作成    編集    削除
    ------------------------------
    グループ     -       -      -
    ユーザー     -       -      -
    フォルダ     +       +      +
    アイテム     +       +      +

##### 3. emmployee

               作成    編集    削除
    ------------------------------
    グループ     -       -      -
    ユーザー     -       -      -
    フォルダ     -       -      -
    アイテム     +       +      +

###4. フォルダ

* フォルダはツリー構造ではなくフラット構造

![flat structure](https://github.com/koyonote/password_app/raw/master/screenshot/tree-flat.jpg "tree flat")

* 1つのフォルダ以下に、アイテムを必要なだけ入れていくイメージ

![folder items](https://github.com/koyonote/password_app/raw/master/screenshot/folder_items.jpg "folder items")

* フォルダの閲覧は、1. グループ単位、2. ユーザー単位、てフィルタを掛けられる

![filter](https://github.com/koyonote/password_app/raw/master/screenshot/filter.jpg "filter")

###5. アイテム

* アイテムとは、アカウントとパスワードをセットにしたもの

        アイテム名  アカウント  パスワード
        --------------------------------
        Google    account   password
        Facebook  account   password
* パスワードの暗号化には AES-256 を使用

