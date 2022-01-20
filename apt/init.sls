/etc/apt/apt.conf.d/99local:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://apt/files/99local
