Role Name
=========

Ansible role to install and configure OpenCart 3.x on Ubuntu 20.x.

Requirements
------------

Vagrant for local testing & development.

Role Variables
--------------

| Variable                    | Type   | Description                                                      |
| --------------------------- |:------:|:-----------------------------------------------------------------:
| install_configure_mysql     | bool   | Whether to install and configure mysql                           |
| map_local_folder            | bool   | Map opencart on host machine for local development               |
| create_opencart_database    | bool   | Whether to create opencart database and user                     | 
| opencart_domain_name        | str    | Domain name (Add it to local hosts file if still not registered) |
| mysql_root_password         | str    | Secure password for mysql root user                              |
| opencart_database_name      | str    | Database name for opencart                                       |
| opencart_database_user      | str    | Database username for opencart                                   |
| opencart_database_password  | str    | Database password for opencart                                   |
| self_signed_certs           | str    | Specify SSL certificate names and path                           |

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

<pre>
  - hosts: all
    vars:
      install_configure_mysql: true
      map_local_folder: false
      create_opencart_database: true
      opencart_domain_name: somedomain.co.il
      mysql_root_password: awTdtyAbK2f0
      opencart_database_name: somedomain
      opencart_database_user: opencart
      opencart_database_password: PYr2qpk1dZoE
      self_signed_certs:
        - key: /etc/ssl/private/somedomain.co.il.key
          cert: /etc/ssl/certs/somedomain.co.il.crt
    roles:
      - role: opencart
</pre>

License
-------

MIT

Author Information
------------------

Mustafa Saadi (0p0inter)
