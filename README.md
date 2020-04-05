# Raspi_Handshake

Raspi_Handshake is a tool to capture automatically handshake with a Raspberry pi or Kali / Parrot desktop over ssh connection.


# HOW TO INSTALL AND RUN ?


## PREREQUISITES 

* Make sure aircrack-ng is updated
* Make sure you know the BSSID and CHANNEL of your target (lol)

### HOW TO SEE BSSID AND CHANNEL OF A WIFI ?

```
iwconfig  [To see your network interface name]
iwlist [your network interface] scan

I.e: iwlist wlanx scan
```
Note the Address (BSSID) and Channel.

### INSTALLATION

```
git clone https://github.com/N0vachr0n0/Raspi_Handshake.git
cd Raspi_Handshake
sudo chmod +x Handshake.sh
sudo ./Handshake.sh
```

### NOTES

Your Raspi or Desktop will reboot automatically  after done (About 3 or 5 minutes to done) so retablish SSH connection and go to Raspi_Handshake directory, you will see a "psk-01.cap" file so run:
```
sudo aircrack-ng psk-01.cap
```
to see if you captured handshake. If you captured so let's crack else run again or check log file for more details.
Thanks !


## LANGUAGE

* English

# CREDIT

* N0vachr0n0

Thanks for using !
And
Go catching all !!
