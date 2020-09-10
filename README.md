# Adversarial Threat Modelling — A Practical Approach to Purple Teaming in the Enterprise

More and more organisations are beginning to realise the value of Mitre ATT&CK. But how can you bring your teams together to help nurture, develop and deploy a framework which consistently yields results?

This presentation details the approach developed by the Threat Intelligence team of a global bank, and how it worked together with defensive and offensive teams to deliver a compelling solution to uplift the organisations' security posture; one adversary TTP at a time.

The corresponding workshop is designed to provide practical guidance to practitioners that they can adapt for their organisations. Key learning objectives will include transforming Purple Team initiatives to be intelligence-led, and developing and deploying a Threat Library.


[![Adversarial Threat Modelling — A Practical Approach to Purple Teaming in the Enterprise](./TitleSlide.png "Adversarial Threat Modelling — A Practical Approach to Purple Teaming in the Enterprise")](./Adversarial-Threat-Modelling_Presentation.pdf)

by Sajid Nawaz Khan, _Cyber Threat Intelligence Analyst_

___

This README is designed to support the above workshop which took place on Friday 11th September 2020 as part of x33fcon: https://www.x33fcon.com/. 

## System Requirements
Please ensure you have installed [VirtualBox](https://www.virtualbox.org) with the [Extension Pack](https://www.virtualbox.org/wiki/Downloads), followed by a virtual machine running x64 [Ubuntu 20.04 LTS](https://wiki.ubuntu.com/Releases). Ideally, the machine should be configured with at least 4GB of RAM with multi-core support.


## Installing Vectr
Detailed installation instructions are available on the [Vectr Documentation](https://docs.vectr.io) site. The code below is provided for convenience to help support the workshop, and is correct for version 5.7.0 of the Community Edition.


### Installing Dependencies
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose unzip

sudo apt upgrade

sudo systemctl enable docker
```
On a minimal install of Ubuntu, you may need to install cURL `sudo apt install curl`.


### Installing Vectr
To minimise issues during the workshop, please continue with default configuration options when installing Vectr. In production environments, configuring additional options within the `.env` file is strongly recommended.

```
sudo mkdir -p /opt/vectr
cd /opt/vectr

sudo wget https://github.com/SecurityRiskAdvisors/VECTR/releases/download/ce-5.7.0/sra-vectr-runtime-5.7.0-ce.zip

sudo unzip sra-vectr-runtime-5.7.0-ce.zip

sudo docker-compose -p sravectr up -d
```

### Updating the Hosts File
For a default install, add `sravectr.internal` to your hosts file as follows:

```
sudo nano /etc/hosts
127.0.0.1   localhost   sravectr.internal
```

## Using Vectr
### Launching Vectr
Use the helper scripts [`start_vectr.sh`](./start_vectr.sh) and [`shutdown_vectr.sh`](./shutdown_vectr.sh) within this repo (be sure to `chmod +x`), or run the following directly from your home folder. The very first launch will take a few minutes as Vectr initialises, so please be patient.

```
cd /opt/vectr
sudo docker-compose up -d
```

Struggling to launch Vectr? Run `sudo docker ps`, `sudo docker stop {containerID}` (or `sudo docker stop $(docker ps -a -q)`) and `sudo docker system prune` and try again.


### Logging into Vectr
You should be able to access Vectr at https://sravectr.internal:8081/. The default username is `admin` and the password is `11_ThisIsTheFirstPassword_11`.


### Safely Shutting Down Vectr
```
cd /opt/vectr
sudo docker-compose down
```

___

## Exercises
### Importing Existing Datasets
1. [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/Indexes/index.yaml)
2. [Mitre Enterprise ATT&CK CTI Bundle](https://github.com/mitre/cti/blob/master/enterprise-attack/enterprise-attack.json)
3. [SRA Iran TTPs](https://github.com/SecurityRiskAdvisors/VECTR/blob/master/cti/Iranian_TTP_Bundle_010920.json)

### Developing your Threat Library for Adversary Simulation
> Creating your own adversary emulation plan draws on the greatest strength of combining red teaming with your own threat intelligence: the behaviors are seen from real-world adversaries targeting you! — _Mitre_

1. [Palo Alto Networks Unit 42 Playbooks](https://pan-unit42.github.io/playbook_viewer/)
2. [APT & Cybercriminals Campaign Collection](https://github.com/CyberMonitor/APT_CyberCriminal_Campagin_Collections)
3. [Malpedia](https://malpedia.caad.fkie.fraunhofer.de)

___

## Further Reading
> Cyber threat intelligence is all about knowing what your adversaries do and using that information to improve decision-making. — _Mitre_

1. [Getting Started with ATT&CK: Threat Intelligence](https://medium.com/mitre-attack/getting-started-with-attack-cti-4eb205be4b2f)
2. [Getting Started with ATT&CK: Adversary Emulation and Red Teaming](https://medium.com/mitre-attack/getting-started-with-attack-red-29f074ccf7e3)
3. [Thai CERT Threat Actor Encyclopedia](https://www.thaicert.or.th/downloads/files/A_Threat_Actor_Encyclopedia.pdf)
4. [Recorded Future Threat Intelligence Handbook](https://go.recordedfuture.com/book)
5. [Adversary Emulation using CALDERA](https://www.slideshare.net/erikvanbuggenhout/adversary-emulation-using-caldera) by Erik Van Buggenhout
6. [Assess your data potential with ATT&CK Datamap](https://medium.com/@olafhartong/assess-your-data-potential-with-att-ck-datamap-f44884cfed11) by Olaf Hartong


### Tools
1. [Mitre ATT&CK Navigator](https://mitre-attack.github.io/attack-navigator/enterprise/)
2. [Threat Report ATT&CK Mapping (TRAM)](https://github.com/mitre-attack/tram) - For rapid triage
3. [Atomic Red Team Specification](https://github.com/redcanaryco/atomic-red-team/blob/master/atomic_red_team/spec.yaml)
4. [Sigma](https://github.com/Neo23x0/sigma)
5. [ATT&CK Techniques Mapped to Data Sources](https://attack.mitre.org/docs/attack_roadmap_2019.pdf)

### Support
1. [Vectr Documentation](https://docs.vectr.io)
2. [Vectr Video Guides](https://docs.vectr.io/How-To-Videos/)
3. [Vectr Issues on Github](https://github.com/SecurityRiskAdvisors/VECTR/issues)
4. [SRA Vectr Homepage](https://sra.io/vectr/)

---

I'd love to hear your thoughts and feedback. Feel free to say hello on Twitter [@snkhan](https://twitter.com/snkhan?lang=en) or via [LinkedIn](https://uk.linkedin.com/in/sajidnawazkhan).

---

#cti #threatintelligence #purpleteam #redteam #blueteam #adversaryemulation #adversarysimulation #vectr #mitre
