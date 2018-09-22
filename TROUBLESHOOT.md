# Troubleshooting

## Tensorflow

- 14 June, 2018
    - `pip install tensorflow` will install the latest version of tensorflow by default.
      There may be bugs. So, use a lower version of tf. Install by 
      `pip install tensorflow==1.5`

## Installing Ubuntu on Ubuntu machine
You may see something like the following error

```
Missing parameter in configuration file 
gfxboot.c32: not a COM32R image
boot:
```

If you hit `tab`, you can see the available options.
You should see `live-install` as one of the options.
**Type** `live-install` and hit the `return` key.
Your Ubuntu installation should then start.

## JVM Certificate Issues
Works for other jdk version but I'm using jdk8 throughout. 

Stuff like this may happen when you install `openjdk-8-jdk` on ubuntu.
```bash
java.lang.RuntimeException: Unexpected error: java.security.InvalidAlgorithmParameterException: the trustAnchors parameter must be non-empty
```
That's due to the bad `cacerts` file in `openjdk`. There is a good one in Oracle. So,
one could go to Oracle and download the `tar.gz` version of `jdk-8`. Then copy the cacerts file from that into `/etc/ssl/certs/java/cacerts`

Or, 
```bash
sudo apt purge openjdk-8-jdk java-common
sudo apt install openjdk-8-jdk
```

