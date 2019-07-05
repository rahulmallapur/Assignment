-------------------------------------------------------------------------------------------------------------------------------------

Pointers:
•	Assume relevant data where-ever necessary
•	Assume suitable base image and libraries
•	Code should be published to personal git-hub profile or be sent as zip.
•	In case of datafiles / databases; relevant data should be uploaded to git-hub or be part of zip.
•	Instructions to run the code be sent as 'README'
Problems:  
1.	Write a Ansible playbook for deploying an image to 20 servers. Each deployment should have a ssh server running in the background. The servers should be ssh-able and display a different welcome banner.


-------------------------------------------------------------------------------------------------------------------------------------
Answers

1. Place dockerfile, before-login-banner and moth.d in same folder to build image.
2. Run following command "docker build -t rahulmallapur22/ubuntu-sshd ." you an use ant name to tag.
3. Image will get built with tag "rahulmallapur22/ubuntu-sshd".
4. Run following command to push image on docker registry "docker image push rahulmallapur22/ubuntu-sshd".
4. Place hosts file in /etc/ansible which is inventory file. Replace SERVER_IP_# with IP's of 20 servers on which images has to be deployed.
5. Run following command "ansible-palybook image-deploy.yml". This will pull the image form docker image and deploy on all nodes.
6. Image has ssh server running in background.
7. ssh to server you will see warning banner "Authorised Personnel only".Enter password  as"root". After entering password you will see another banner " Welcome root to server SERVERNAME".
8. username and password is same "root".



