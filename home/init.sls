{% import_yaml 'home/defaults.yaml' as home_defs %}

{% for dir in home_defs.config.dirs %}

/home/{{ home_defs.config.user }}/{{ dir }}:
  file.directory:
    - user: {{ home_defs.config.user }}
    - group: {{ home_defs.config.user }}
    - mode: '0700'

{% endfor %}
