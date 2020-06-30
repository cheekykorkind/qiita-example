# PRIVATE_KEYの位置
PRIVATE_KEY=../docker-ssh/docker-ssh-key

ansible-playbook local_docker_book.yml -i local_hosts -u ec2-user --private-key ${PRIVATE_KEY}
# ansible-playbook local_docker_book.yml -i local_hosts -u ec2-user --private-key ${PRIVATE_KEY} -vvv