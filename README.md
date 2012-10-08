テトロミノ認識
==============

[鍋谷さん]が開催している「オフラインリアルタイムどう書く」の第四回「[テトロミノ認識]」の回答実装例です。


C++
---

処理系はC++98です。
テストには[Google Test]を利用しています。

* tetromino.cpp
* tetrominoTest.cpp


Prolog
------

処理系には[SWI-Prolog]を使用しています。

* tetromino.pl
* testpattern.txt （テストパターン）

Haskell
-------

処理系はGHC version 7.4.2です。
違うアプローチのコードを2つ。

* tetromino.hs
* tetromino2.hs

[SWI-Prolog]: http://www.swi-prolog.org
[テトロミノ認識]: http://nabetani.sakura.ne.jp/hena/ord4tetroid/
[鍋谷さん]: http://atnd.org/users/58114
[Google Test]: http://code.google.com/p/googletest/
