#!/bin/sh

apt-get update

apt-get install google-chrome-stable

echo "Install core..."
apt-get install guake mc curl vim git xclip

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


echo "Install PHP PEAR and COMMON functions..."

echo "PHP-PEAR...."
apt-get install php-pear

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

pear channel-discover pear.phpmd.org
pear channel-discover pear.pdepend.org
pear install --alldeps phpmd/PHP_PMD

pear install pear.apigen.org/apigen

pear channel-discover pear.phpmd.org
pear channel-discover pear.pdepend.org
pear install --alldeps phpmd/PHP_PMD

echo "PHAR..."

# conposer
curl -sS https://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar /usr/local/bin/composer

# PHPUnit
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
mv phpunit.phar /usr/local/bin/phpunit

# PHPUnit-Skelgen
wget https://phar.phpunit.de/phpunit-skelgen.phar
chmod +x phpunit-skelgen.phar
mv phpunit-skelgen.phar /usr/local/bin/phpunit-skelgen

# PHPLoc
wget https://phar.phpunit.de/phploc.phar
chmod +x phploc.phar
mv phploc.phar /usr/local/bin/phploc

# PDepend
wget http://static.pdepend.org/php/1.1.0/pdepend.phar
chmod +x pdepend.phar
mv pdepend.phar /usr/local/bin/pdepend

# PHpcpd
wget https://phar.phpunit.de/phpcpd.phar
chmod +x phpcpd.phar
mv phpcpd.phar /usr/local/bin/phpcpd

# PHPDox
wget http://phpdox.de/releases/phpdox.phar
chmod +x phpdox.phar
mv phpdox.phar /usr/local/bin/phpdox


