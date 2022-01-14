{% import_yaml 'home/defaults.yaml' as home %}
{% import_yaml 'masterless/defaults.yaml' as masterless %}

{{ masterless.config.base_root }}:
  file.directory:
    - user: {{ home.config.user }}
    - group: {{ home.config.user }}
    - mode: '0700'
    - makedirs: True

{{ masterless.config.base_repo }}:
  git.latest:
    - target: {{ masterless.config.base_root }}

/etc/salt/minion.d:
  file.directory:
    - user: {{ home.config.user }}
    - group: {{ home.config.user }}
    - mode: '0755'

/etc/salt/minion.d/masterless.conf:
  file.managed:
    - user: {{ home.config.user }}
    - group: {{ home.config.user }}
    - mode: '0644'
    - source: salt://masterless/files/masterless.conf
    - template: jinja
    - defaults:
        base_root: {{ masterless.config.base_root }}
    - require:
        - file: /etc/salt/minion.d

{# Change the permissions on this set of directories,
   so salt-call can function as the user. #}

{% for dir in masterless.default_dirs %}

{{ dir }}:
  file.directory:
    - user: {{ home.config.user }}
    - group: {{ home.config.user }}
    - dir_mode: '0755'
    - file_mode: '0644'
    - recurse:
      - user
      - group
      - mode

{% endfor %}
