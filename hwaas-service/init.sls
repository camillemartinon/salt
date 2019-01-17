include:
  - hwaas-site

supervisor:
  pkg.installed:
    - require:
      - sls: hwaas-site

supervisord:
  service.running:
    - watch:
      - file: /etc/supervisord.d/hwaas-site.ini

restart-hwaas-site:
  supervisord.running:
    - name: hwaas-site
    - watch:
      - sls: hwaas-site

/etc/supervisord.d/hwaas-site.ini:
  file.managed:
    - source: salt://hwaas-service/supervisor.conf
    - require:
      - pkg: supervisor
