oracle-java7-installer
======================

Breaking the Oracle Terms of Service in the nicest possible way.

Until very recently, it was possible to get sun-java7-jdk packages directly from Ubuntu.  Then Oracle changed their TOS.

Then someone made an installer, which was *ok*.. But I wanted a debian package format.

So, all you need to do is:

For Java 7 u80:

1. Download the `jdk-7u80-linux-x64.tar.gz` file

2. Drop that file in `src/var/cache/oracle-jdk7-installer/jdk-7u80-linux-x64.tar.gz`

3. Install vagrant, virtualbox (you may need to log out and log in because you added a user to the vboxusers group)

       ```bash
       sudo apt-get update
       sudo apt-get install vagrant
       ```

4. Setup `JAVA_VERSION` variable in the `env.vars`

       ```bash
       PATH=/home/vagrant/bin:$PATH
       JAVA_VERSION=7u80
       ```

5. (Оptional) Setup distro name in the `Vagrantfile`

       ```ruby
             db.vm.box = "ubuntu/xenial64"
       ```

6. Run building oracle java package

       ```bash
       vagrant up
       ```
7. Builded package package will appear in the current directory, for example

       ```bash
       ls -1 *.deb
       oracle-java7-installer_7u80-custom-xenial-r100_amd64.deb
       ```

The biggest reason for doing it this way rather than using <http://www.webupd8.org/2012/06/how-to-install-oracle-java-7-in-debian.html> is because this way gives  you a fat .deb file containing java, so you can install it in places that might not have connectivity (or have slow connectivity).

Also, Oracle will probably cripple the webupd8 method at some point, probably by putting a captcha in front of the downloads page.  Wouldn't surprise me.  The advantage of doing it this way is you do it once, update the deb build environment.  Build the deb, install it.  Done.
