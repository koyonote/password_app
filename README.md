## What is this?
* 小･中規模な組織が
* パスワードを共有し
* 効率的に管理するための
* アプリケーション

## Who needs this?
* 組織内で、パスワードの共有･管理を一元化したい
* パスワードを暗号化してデータベースに保存したい
* できるだけシンプルなシステムを使いたい

## Features
####1. フォルダとアイテム

* アイテムとは、アカウントとパスワードをセットにしたもの

        アイテム名  アカウント  パスワード
        --------------------------------
        Google    account   password
        Facebook  account   password

* フォルダはツリーではなくフラット構造

![flat structure](https://github.com/koyonote/password_app/raw/master/screenshot/tree-flat.jpg "tree flat")

* 1つのフォルダ以下に、アイテムを必要なだけ入れていくイメージ

![folder items](https://github.com/koyonote/password_app/raw/master/screenshot/folder_items.jpg "folder items")

* あるフォルダへの閲覧権限は、1. グループ、2. ユーザー、3. グループとユーザーの組み合わせ、によってフィルタを掛けられる
* パスワードの暗号化には AES-256 を使用

####2. グループとユーザー
* フォルダと同様に、グループもフラット構造
* ユーザーは複数のグループに属することができる
* グループは必要なだけ作ることができ、フォルダにフィルタを掛ける際に威力を発揮する
* 各ユーザーは、3種のロールによって権限が異なる（詳しくは、Roles を参照下さい）

## Roles
各ユーザーには、下記3種類のロールのいずれかを与えます. ロールごとの権限を表に示します.

#### 1. admin

               作成    編集    削除
    ------------------------------
    グループ     +       +      +
    ユーザー     +       +      +
    フォルダ     +       +      +
    アイテム     +       +      +

#### 2. manager

               作成    編集    削除
    ------------------------------
    グループ     -       -      -
    ユーザー     -       -      -
    フォルダ     +       +      +
    アイテム     +       +      +

#### 3. emmployee

               作成    編集    削除
    ------------------------------
    グループ     -       -      -
    ユーザー     -       -      -
    フォルダ     -       -      -
    アイテム     +       +      +



## Demo
### Visit the [Demo Page](http://password-app.heroku.com/login "Demo")


#### manager

    login: demo-manager
    password: demo

#### employee

    login: demo-employee
    password: demo

## Usage
ローカル環境で動かすための手順の一例を挙げます.

1.クローン

    git clone git://github.com/koyonote/password_app.git

2.config/database.yml.example をコピーして config/database.yml を作成、DB環境に合わせて編集

    cp config/database.yml.example config/database.yml

3.gem をインストール

    bundle install --deployment

4.テーブル作成＆初期データ挿入

    rake db:migrate
    rake db:seed

5.サーバー起動

    rails s

6.下記の初期ユーザーでログイン

    login: foo
    password: bar

