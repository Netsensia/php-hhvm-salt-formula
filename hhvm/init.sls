include:
  - php-hhvm-salt-formula.nginx

configure_hhvm_repo:
  pkg.installed:
    - name: software-properties-common
  cmd.run:
    - name: sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
    - unless: apt-key list | grep -q 1BE7A449
    - require:
      - file: /etc/apt/sources.list.d/hhvm.list
      
/etc/apt/sources.list.d/hhvm.list:
  file:
    - managed
    - contents: |
        deb http://dl.hhvm.com/ubuntu trusty main
    - skip_verify: True
    
hhvm:
  pkg:
    - name: hhvm
    - installed
    - refresh: True
    - skip_verify: True
    - require:
      - cmd: configure_hhvm_repo
 
configure_nginx_for_hhvm:
  cmd.run:
    - name: /usr/share/hhvm/install_fastcgi.sh
    - require:
      - pkg: nginx
      - pkg: hhvm
    - watch_in:
      - module: nginx-restart

/usr/share/nginx/html/hello.php:
  file.managed:
    - contents: |
        <?php
        echo "hello world\n";