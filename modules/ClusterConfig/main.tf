resource "null_resource" "ops_config" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers {
    cluster_instance_ids = "${var.bastion_host}"
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    type = "ssh"
    host = "${var.bastion_host}"
    user = "${var.bastion_user}"
  }

  provisioner "file" {
    source      = "${path.module}/files/requirements.txt"
    destination = "/tmp/requirements.txt"
  }

  provisioner "file" {
    source      = "${path.module}/playbooks"
    destination = "/tmp/playbooks"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /etc/ansible",
      "sudo chown -R ${var.bastion_user} /etc/ansible",
    ]
  }

  provisioner "file" {
    source      = "${path.module}/files/ansible.cfg"
    destination = "/etc/ansible/ansible.cfg"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y python-pip",
      "sudo pip install -r /tmp/requirements.txt",
      "sudo chmod +x /tmp/playbooks/inventories/ec2.py",
      "ansible -i /tmp/playbooks/inventories/ec2.py tag_cluster_id_${var.cluster_id} -b -m raw -a 'sudo bash -c \"test -e /usr/bin/python || (apt -qqy update && apt install -qy python-minimal)\"'",
      "ansible-playbook /tmp/playbooks/consul_agent.yaml -i /tmp/playbooks/inventories/ec2.py -l tag_cluster_id_${var.cluster_id} -b -u ${var.bastion_user} -e consul_init=true -e consul_version=${var.consul_version} -e consul_connect=${var.consul_connect}",
    ]
  }
}
