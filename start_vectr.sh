# Save this in your home folder, to quickly launch VECTR
# Sajid Nawaz Khan, 06/09/2020
# Adversarial Threat Modelling — A Practical Approach to Purple Teaming in the Enterprise
# https://github.com/ssnkhan/adversarial-threat-modelling

cd /opt/vectr
sudo docker-compose up -d
sleep 30
firefox "https://sravectr.internal:8081/sra-purpletools-webui/app/#" &
