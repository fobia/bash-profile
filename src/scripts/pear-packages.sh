#!/bin/sh

# #
# # CHANNELS
# #
pear channel-discover components.ez.no
pear channel-discover doc.php.net
pear channel-discover pear.andrewsville.cz
pear channel-discover pear.apigen.org
pear channel-discover pear.kukulich.cz
pear channel-discover pear.netpirates.net
pear channel-discover pear.nette.org
pear channel-discover pear.pdepend.org
pear channel-discover pear.phing.info
pear channel-discover pear.php.net
pear channel-discover pear.phpmd.org
pear channel-discover pear.phpunit.de
pear channel-discover pear.symfony.com
pear channel-discover pear.texy.info
pear channel-discover pecl.php.net


# #
# # PACKAGES INSTALL
# #
pear install components.ez.no/Base
pear install components.ez.no/ConsoleTools
pear install components.ez.no/Database

pear install pear.andrewsville.cz/TokenReflection

pear install pear.apigen.org/ApiGen

pear install pear.kukulich.cz/FSHL

pear install pear.netpirates.net/Autoload
pear install pear.netpirates.net/DirectoryScanner

pear install pear.nette.org/Nette

pear install pear.pdepend.org/PHP_Depend

pear install pear.phing.info/phing

pear install pear.php.net/Archive_Tar
pear install pear.php.net/Console_CommandLine
pear install pear.php.net/Console_Getopt
pear install pear.php.net/PEAR
pear install pear.php.net/PHP_CodeSniffer
pear install pear.php.net/Structures_Graph
pear install pear.php.net/XML_Util

pear install pear.phpmd.org/PHP_PMD

pear install pear.phpunit.de/File_Iterator
pear install pear.phpunit.de/PHPUnit
pear install pear.phpunit.de/PHPUnit_MockObject
pear install pear.phpunit.de/PHPUnit_SkeletonGenerator
pear install pear.phpunit.de/PHP_CodeCoverage
pear install pear.phpunit.de/PHP_Timer
pear install pear.phpunit.de/PHP_TokenStream
pear install pear.phpunit.de/Text_Template

pear install pear.symfony.com/Yaml

pear install pear.texy.info/Texy


