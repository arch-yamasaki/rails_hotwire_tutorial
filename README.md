# README


## turboについて

### turbo frameについて


### turbo streamについて


## つまずいたエラー集

つまずいたエラーとその対応策を簡単に書く


### aptで普通に入れたnodeはversionが古い

aptだとそうなる。最新版でないとturboが上手く入らないので、dokcerfileに以下を入れ込む。

```Dockerfile

# linuxで入るnodeは古いものなので、nを使用して最新版に変更する。
RUN npm install --global n
RUN n stable
RUN apt purge -y nodejs npm
RUN npm install --global yarn

```

### turboが上手く動かない


rails newで失敗するとturboが上手く動かない。
その際には`application.html.erb`のheader内に以下を入れると動く。

```erb
<html>
  <head>
  ...
  <!-- 追加 -->
  <%= turbo_include_tags %>
  </head>
  <body>
  ....
```

### sassが入ってないエラー

```sh
npm install sass
```

### esbuildがないエラー

rails newをした際にesbuildがうまくインストールされてないことによるエラー。多分turboとかも入ってない。

- https://github.com/rails/rails/issues/44182

```sh

npm run build

> build
> esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds

sh: 1: esbuild: not found
npm ERR! code 127
npm ERR! path /app
npm ERR! command failed
npm ERR! command sh -c esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds

npm ERR! A complete log of this run can be found in:
npm ERR!     /root/.npm/_logs/2023-02-09T09_11_32_072Z-debug.log
root@d1c29094d670:/app# esbuild --verison
bash: esbuild: command not found
root@d1c29094d670:/app# sass -v
bash: sass: command not found
root@d1c29094d670:/app# scss -v
bash: scss: command not found
root@d1c29094d670:/app# sass
bash: sass: command not found
root@d1c29094d670:/app# npm run build:css


 npm run build

> build
> esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds

✘ [ERROR] Could not resolve "@hotwired/turbo-rails"

    app/javascript/application.js:2:7:
      2 │ import "@hotwired/turbo-rails"
        ╵        ~~~~~~~~~~~~~~~~~~~~~~~

  You can mark the path "@hotwired/turbo-rails" as external to exclude it from the bundle, which
  will remove this error.

✘ [ERROR] Could not resolve "@hotwired/stimulus"

    app/javascript/controllers/hello_controller.js:1:27:
      1 │ import { Controller } from "@hotwired/stimulus"
        ╵                            ~~~~~~~~~~~~~~~~~~~~

  You can mark the path "@hotwired/stimulus" as external to exclude it from the bundle, which will
  remove this error.

✘ [ERROR] Could not resolve "@hotwired/stimulus"

    app/javascript/controllers/application.js:1:28:
      1 │ import { Application } from "@hotwired/stimulus"
        ╵                             ~~~~~~~~~~~~~~~~~~~~

  You can mark the path "@hotwired/stimulus" as external to exclude it from the bundle, which will
  remove this error.
```

```sh
npm install --dev esbuild 
npm install @hotwired/stimulus @hotwired/turbo-rails
```
