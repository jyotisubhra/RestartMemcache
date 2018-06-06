#!groovy

properties([parameters([
choice(choices: ['SBX', 'INT', 'UAT', 'T4CD'].join("\n"), defaultValue: 'SBX', description: 'The environment to restart memcache',  name: 'option_environment'),
])])

node('master') {
	stage('Log in') {
	echo "Logging to: Environment - " + params.option_environment
    }
	stage('Restarting') {
if (params.option_environment == 'SBX') {
echo "Restarting all memcached instances..."
sh (script: """ssh vmh-lh-adcs-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-faresearch.service\'""")
sh (script: """ssh vmh-lh-adcs-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-offer.service\'""")
sh (script: """ssh vmh-lh-adcs-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-fares.service\'""")
sh (script: """ssh vmh-lh-adcs-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-avail.service\'""")
sh (script: """ssh vmh-lh-adcs-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-airoffer.service\'""")
echo "Restart of all memcached instances done!"
         }
else if (params.option_environment == 'INT') {
echo "Restarting all memcached instances..."
sh (script: """ssh vmh-lh-adci-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-faresearch.service\'""")
sh (script: """ssh vmh-lh-adci-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-offer.service\'""")
sh (script: """ssh vmh-lh-adci-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-fares.service\'""")
sh (script: """ssh vmh-lh-adci-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-avail.service\'""")
sh (script: """ssh vmh-lh-adci-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-airoffer.service\'""")
echo "Restart of all memcached instances done!"
         }
else if (params.option_environment == 'UAT') {
echo "Restarting all memcached instances..."
sh (script: """ssh vmh-lh-adcu-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-faresearch.service\'""")
sh (script: """ssh vmh-lh-adcu-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-offer.service\'""")
sh (script: """ssh vmh-lh-adcu-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-fares.service\'""")
sh (script: """ssh vmh-lh-adcu-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-avail.service\'""")
sh (script: """ssh vmh-lh-adcu-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-airoffer.service\'""")
echo "Restart of all memcached instances done!"
         }
else if (params.option_environment == 'T4CD') {
echo "Restarting all memcached instances..."
sh (script: """ssh vmh-lh-adcc-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-faresearch.service\'""")
sh (script: """ssh vmh-lh-adcc-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-offer.service\'""")
sh (script: """ssh vmh-lh-adcc-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-fares.service\'""")
sh (script: """ssh vmh-lh-adcc-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-avail.service\'""")
sh (script: """ssh vmh-lh-adcc-dlxdud02a.dlh.de \'sudo /usr/bin/systemctl restart memcached-airoffer.service\'""")
echo "Restart of all memcached instances done!"
         }
    }
}