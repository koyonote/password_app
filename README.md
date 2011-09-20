## What is this?
パスワードを共有＆管理するアプリケーションです.


## Usage
### 《Local》
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

## Features
### 《ロール》
各ユーザーには、下記3種類のロールのいずれかを与えます. ロールごとの権限は表に示したとおりです。

#### 1. admin
<table>
<tr>
  <td></td>
  <td>作成</td>
  <td>編集</td>
　<td>削除</td>
</tr>
<tr>
  <td>グループ</td>
  <td align="center">○</td>
  <td align="center">○</td>
  <td align="center">○</td>
</tr>
<tr>
  <td>ユーザー</td>
  <td align="center">○</td>
  <td align="center">○</td>
  <td align="center">○</td>
</tr>
<tr>
  <td>フォルダ</td>
  <td align="center">○</td>
  <td align="center">○</td>
  <td align="center">○</td>
</tr>
<tr>
  <td>アイテム</td>
  <td align="center">○</td>
  <td align="center">○</td>
  <td align="center">○</td>
</tr>
</table>
#### 2. manager
<table>
<tr>
  <td></td>
  <td>作成</td>
  <td>編集</td>
　<td>削除</td>
</tr>
<tr>
  <td>グループ</td>
  <td align="center">×</td>
  <td align="center">×</td>
  <td align="center">×</td>
</tr>
<tr>
  <td>ユーザー</td>
  <td align="center">×</td>
  <td align="center">×</td>
  <td align="center">×</td>
</tr>
<tr>
  <td>フォルダ</td>
  <td align="center">○</td>
  <td align="center">○</td>
  <td align="center">○</td>
</tr>
<tr>
  <td>アイテム</td>
  <td align="center">○</td>
  <td align="center">○</td>
  <td align="center">○</td>
</tr>
</table>
#### 3. emmployee
<table>
<tr>
  <td></td>
  <td>作成</td>
  <td>編集</td>
　<td>削除</td>
</tr>
<tr>
  <td>グループ</td>
  <td align="center">×</td>
  <td align="center">×</td>
  <td align="center">×</td>
</tr>
<tr>
  <td>ユーザー</td>
  <td align="center">×</td>
  <td align="center">×</td>
  <td align="center">×</td>
</tr>
<tr>
  <td>フォルダ</td>
  <td align="center">×</td>
  <td align="center">×</td>
  <td align="center">×</td>
</tr>
<tr>
  <td>アイテム</td>
  <td align="center">○</td>
  <td align="center">○</td>
  <td align="center">○</td>
</tr>
</table>

## Demo
[Launch Demo](http://password-app.heroku.com/login "Demo")

#### manager

    login: demo-manager
    password: demo

#### employee

    login: demo-employee
    password: demo

