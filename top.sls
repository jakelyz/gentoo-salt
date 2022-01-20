# jakelyz/salt config

base:
  '*':
    - masterless
    - home
  
  'os:Debian':
    - match: grain
    - apt
    - packages.debian
