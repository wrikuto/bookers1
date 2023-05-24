# 修正箇所

## 出ていたエラーの一覧
rspec ./spec/system/books_spec.rb:28 # 投稿のテスト 一覧画面のテスト 一覧の表示とリンクの確認 bookのタイトルと感想を表示し、詳細・編集・削除のリンクが表示されているか
rspec ./spec/system/books_spec.rb:56 # 投稿のテスト 一覧画面のテスト 投稿処理に関するテスト 投稿に成功しサクセスメッセージが表示されるか
rspec ./spec/system/books_spec.rb:62 # 投稿のテスト 一覧画面のテスト 投稿処理に関するテスト 投稿に失敗する
rspec ./spec/system/books_spec.rb:75 # 投稿のテスト 一覧画面のテスト book削除のテスト application.html.erbにjavascript_pack_tagを含んでいるか
rspec ./spec/system/books_spec.rb:86 # 投稿のテスト 一覧画面のテスト book削除のテスト bookの削除
rspec ./spec/system/books_spec.rb:138 # 投稿のテスト 編集画面のテスト 表示の確認 Showリンクが表示される
rspec ./spec/system/books_spec.rb:148 # 投稿のテスト 編集画面のテスト リンクの遷移先の確認 Showの遷移先は詳細画面か
rspec ./spec/system/books_spec.rb:160 # 投稿のテスト 編集画面のテスト 更新処理に関するテスト 更新に成功しサクセスメッセージが表示されるか


## 実際：
　(解決)　application.html.erbの不備によるものでした。
（解決）投稿に成功した場合のサクセスメッセージについては、文字列の不一致だったので、修正してエラーは解消されました。
（解決）投稿の失敗にいても、errorの文字列が欠けていたようなので、修正して問題は解消されました
（解決）application.html.erbにjavascript_pack_tagを含んでいるかについては、本来あるべき場所にapplication.html.erbがなかったことが原因のようでした。
（解決）book削除のテスト。 これについても、application.html.erbが存在せず、javascriptが機能しなかったことが原因でした。
（解決）編集画面のテスト リンクの遷移先の確認 Showの遷移先は詳細画面か　→　単純に遷移先をeditにしてしまっていました。
（解決）新に成功しサクセスメッセージが表示されるかですが、これに関してはメッセージにsucsessの文字列が不足していたとのことなので、修正してエラーが解消されました。

---
application.html.erbがなぜか存在してなかったために、deleteメソッドが機能せず散々苦労させられました。
おかげでいい勉強になりました。