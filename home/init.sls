{% import_yaml 'home/defaults.yaml' as home %}

{% for dir in home.config.dirs %}

/home/{{ home.config.user }}/{{ dir }}:
  file.directory:
    - user: {{ home.config.user }}
    - group: {{ home.config.user }}
    - mode: '0700'

{% endfor %}
