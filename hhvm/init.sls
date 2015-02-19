include:
  - nginx
  
hhvm:
  cmd.run:
    - name: sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
    - unless: apt-key list | grep -q 0x5a16e7281be7a449
    - require:
      - file: /etc/apt/sources.list.d/hhvm.list
  file:
    - managed
    - name: /etc/apt/sources.list.d/hhvm.list
    - source: salt://_libs/hhvm/files/hhvm.list
    - skip_verify: True
  pkg:
    - installed
    - refresh: True
    - skip_verify: True
 
configure_nginx_for_hhvm:
  cmd.run:
    - name: /usr/share/hhvm/install_fastcgi.sh
    - require:
      - pkg: nginx   
    - watch_in:
      - module: nginx-restart
  
