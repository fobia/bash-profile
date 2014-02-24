#!/bin/sh

apt-get update

apt-get install google-chrome-stable

echo "Install core..."
apt-get install guake mc curl vim git 

echo "Install php5..."
add-apt-repository ppa:ondrej/php5
apt-get update
apt-get install python-software-properties
apt-get install php5 php5-cli php5-mysql php5-curl php5-xsl php5-xdebug

echo "Install git..."
apt-get install git git-sh git-svn git-gui

echo "Install mysql..."
apt-get install mysql-common mysql-client-5.5 mysql-server-5.5

echo "Install WebServer..."
apt-get install apache2

echo "Install DevTools..."
apt-get install nodejs node-less npm gem ant

apt-get install xclip

# curl -sS https://getcomposer.org/installer | php
# chmod +x composer.phar
# mv composer.phar /usr/local/bin/composer

pear config-set auto_discover 1
pear install pear/console_commandline
pear install pear/PHP_CodeSniffer

pear channel-discover components.ez.no
pear install ezc/base
pear install ezc/database
pear install ezc/consoletools

pear channel-discover pear.netpirates.net
pear install -a TheSeer/autoload

pear channel-discover pear.phpunit.de
pear install phpunit/phpunit
pear install phpunit/PHPUnit_SkeletonGenerator

# wget https://phar.phpunit.de/phpunit.phar
# chmod +x phpunit.phar
# mv phpunit.phar /usr/local/bin/phpunit

# wget https://phar.phpunit.de/phpunit-skelgen.phar
# chmod +x phpunit-skelgen.phar
# mv phpunit-skelgen.phar /usr/local/bin/phpunit-skelgen

pear channel-discover pear.phpmd.org
pear channel-discover pear.pdepend.org
pear install --alldeps phpmd/PHP_PMD

pear install pear.apigen.org/apigen