Laboratório para o curso do MongoDB
=============================

Dependências
------------

Para que tudo isso funcione, você precisa ter instalado em sua máquina:

* Git
* VirtualBox]
* Vagrant

O Vagrant irá criar VM's baseados na configuração do VagrantFile.

Esse File irá criar um servidor mongoS para rotear o mongo, dois config servers para simular os servidores de configuração, dois pares de shards e uma máquina de monitoramento.

Nome         | vCPUs | Memoria RAM | IP             | S.O.     | 
------------ |:-----:|:-----------:|:--------------:|:--------:|
router-mongo | 1     | 512MB       | 192.168.100.10 | centos/8 | 
conf-01      | 1     | 512MB       | 192.168.100.11 | centos/8 | 
conf-02      | 1     | 512MB       | 192.168.100.12 | centos/8 | 
sh-pri-01    | 1     | 512MB       | 192.168.100.13 | centos/8 | 
sh-pri-02    | 1     | 512MB       | 192.168.100.14 | centos/8 | 
sh-seg-01    | 1     | 512MB       | 192.168.100.15 | centos/8 | 
sh-seg-02    | 1     | 512MB       | 192.168.100.16 | centos/8 | 
monitoring   | 1     | 512MB       | 192.168.100.254| centos/8 | 

> **Atenção** Recomendamos máquinas com 16GB.


Comandos                  | Descrição
:------------------------:| ---------------------------------------
`vagrant up <vm>`         | Inicia as VMs e executa o VagrantFile
`vagrant status`          | Mostra o estado atual das VMs.
`vagrant ssh <vm>`        | Faz ssh para a VM.
`vagrant suspend`         | Desliga a VM, mas mantém o estado atual salvo
`vagrant halt`            | Desliga as VMs.


* 1 - Desabilite o controle de IP do virtualbox:

vim /etc/vbox/networks.conf

Inclua essa linha e salve o arquivo: 

```bash
  * 0.0.0.0/0 ::/0
``` 
