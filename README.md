# opencart-ansible-galaxy
Ansible role to install and configure OpenCart 3.x on Ubuntu 20.x


#### Prerequisites
- Ansible 2.x
- Vagrant (for local development)


#### Running basic Ubuntu Vagrant image with openssh-server (the ansible node)

*If you want to map a local opencart folder, make sure to uncomment lines 13,14 in Vagrantfile.*

<pre>
vagrant up
</pre>


#### Add domain to local hosts file for development
<pre>
sudo vim /etc/hosts
</pre>

<pre>
127.0.0.1       somedomain.co.il
</pre>

#### Configure ansible hosts and credentials (for testing purposes, this should be configued with asymmetric encryption) 
<pre>
sudo vim /etc/ansible/hosts
</pre>


<pre>
[lab]
127.0.0.1

[all:vars]
ansible_connection=ssh
ansible_user=root
ansible_ssh_pass=rootroot
</pre>


#### List ansible inventory
<pre>
ansible-inventory --list -y
</pre>


#### Testing the connection
<pre>
ansible all -m ping -u test
</pre>


#### Running test Ad-Hoc commands
<pre>
ansible all -a "df -h" -u test
</pre>


#### Running the playbook
<pre>
ansible-playbook playbook.yml -Kk
</pre>


#### Complete installation
<pre>
https://somedomain.co.il:8080
</pre>