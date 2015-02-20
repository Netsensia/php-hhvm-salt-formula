{% set user = "cmoreton" %}

install_emacs:
  pkg.installed:
    - name: emacs
  
/home/{{ user }}/.emacs.d/hack-mode.el:
  file.managed:
    - source: https://raw.githubusercontent.com/facebook/hhvm/master/hphp/hack/editor-plugins/emacs/hack-mode.el
    - source_hash: sha256=f1e3986743ae11bba8b04628b0e3672be57f01b5bfe382173bc9261c6d92accc
    - make_dirs: true
    
/home/{{ user }}/.emacs.d/hack-for-hiphop.el:
  file.managed:
    - source: https://raw.githubusercontent.com/facebook/hhvm/master/hphp/hack/editor-plugins/emacs/hack-for-hiphop.el
    - source_hash: sha256=185f32e9f339991300d40dad25f40de785e8b24789dbe7e607e9d285426c1bd6
    - make_dirs: true