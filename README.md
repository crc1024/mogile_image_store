# MogileImageStore

[![Code Climate](https://codeclimate.com/github/greenbell/mogile_image_store.png)](https://codeclimate.com/github/greenbell/mogile_image_store)

This project rocks and uses MIT-LICENSE.

## mogile_fs.ymlの設定
### hosts
MogileFS trackerホスト群

    hosts:    [192.168.0.1:7001, 192.168.0.2:7001]

### domain
画像保存に使うMogileFSドメイン名

      domain:   dev

### class
画像保存に使うMogileFSクラス名

      class:    image

### reproxy
画像を返す際にReproxyヘッダを使うのか、それとも直接画像データを返すのかを設定

       reproxy:  true

### cache
PerlbalにReproxyキャッシュをさせたい場合にキャッシュする秒数を設定

      cache:    604800

### base_url
外側（インターネット側）から画像のURLとしてつないできて欲しいアドレス・パスを絶対URLで指定

      base_url: 'http://mogile.test:9080/image/'

### perlbal
内側（Railsアプリ側）から見たperlbal。Reproxy Cache Clearを行うPOSTリクエストの接続先。省略するとbase_urlの「ホスト名：ポート番号」が使われる

      perlbal:  192.168.11.69:9080

### mount_at
画像表示のためのactionのルートを作る場合はこれを設定

      mount_at: /image/

### secret
Reproxy Cache Clearリクエストのために使う認証キー。リクエストする側と受ける側で一致する必要がある。rake secretで生成した値を貼るのが推奨。

      secret:   f8e4bf7...
