vagrant up
vagrant ssh master -c "kubectl apply -R -f /home/vagrant/k8s/app-example/"
vagrant ssh master -c "curl http://172.16.1.110:30080"
