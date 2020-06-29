
# PRIVATE_KEYは開発環境で作ったvagrantの秘密鍵です。
PRIVATE_KEY=../../docker-ssh/docker-ssh-key

ansible-playbook localSetupPlaybook.yml -i dev_hosts -u ec2-user --private-key ${PRIVATE_KEY} -vvv

# ansible-playbook localSetupPlaybook.yml -i dev_hosts.yml -u ec2-user --private-key ${PRIVATE_KEY}




# ansible-playbook localSetupPlaybook.yml -i dev_hosts -u ec2-user -K --private-key ../../docker-ssh/docker-ssh-key

# [localnginx]
#     ansible_port: 3000
#     ansible_connection=local
#     ansible_host: 127.0.0.1

# [localnginx]
# 127.0.0.1:3000