{% import_yaml 'home/defaults.yaml' as home_defs %}

{% for dir in home_defs.config.dirs %}

/home/jakelyz/{{ dir }}:
  file.directory:
    - user: jakelyz
    - group: jakelyz
    - mode: '0755'

{% endfor %}
