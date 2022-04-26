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

Nome         | vCPUs | Memoria RAM | IP             | S.O.         | 
------------ |:-----:|:-----------:|:--------------:|:------------:|
router-mongo | 1     | 512MB       | 192.168.100.10 | Ubuntu 20.04 | 
conf-01      | 1     | 512MB       | 192.168.100.11 | Ubuntu 20.04 | 
conf-02      | 1     | 512MB       | 192.168.100.12 | Ubuntu 20.04 | 
sh-pri-01    | 1     | 512MB       | 192.168.100.13 | Ubuntu 20.04 | 
sh-pri-02    | 1     | 512MB       | 192.168.100.14 | Ubuntu 20.04 | 
sh-seg-01    | 1     | 512MB       | 192.168.100.15 | Ubuntu 20.04 | 
sh-seg-02    | 1     | 512MB       | 192.168.100.16 | Ubuntu 20.04 | 
monitoring   | 1     | 512MB       | 192.168.100.254| Ubuntu 20.04 | 

> **Atenção** Recomendamos máquinas com 16GB.


Comandos                  | Descrição
:------------------------:| ---------------------------------------
`vagrant up <vm>`         | Inicia as VMs e executa o VagrantFile
`vagrant status`          | Mostra o estado atual das VMs.
`vagrant ssh <vm>`        | Faz ssh para a VM.
`vagrant suspend`         | Desliga a VM, mas mantém o estado atual salvo
`vagrant halt`            | Desliga as VMs.


Se ocorrer algum erro ao subir o virtualbox, favor seguir esse procedimento abaixo:

* 1 - Desabilite o controle de IP do virtualbox:

vim /etc/vbox/networks.conf

Inclua essa linha e salve o arquivo: 

```bash
  * 0.0.0.0/0 ::/0
``` 
