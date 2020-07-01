# PRIVATE_KEYの位置
PRIVATE_KEY=../docker-ssh/docker-ssh-key

ansible-playbook local_docker_book.yml -i local_hosts -u ec2-user --private-key ${PRIVATE_KEY}
# ansible-playbook local_docker_book.yml -i local_hosts -u ec2-user --private-key ${PRIVATE_KEY} -vvv

# https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html
# コマンドラインoption説明
# i： カスタムinventoryファイルパスを指定
# u：sshログインするユーザー名
# private-key：sshログインで使う秘密鍵
# vvv：ansibleの作業詳細を出力する
