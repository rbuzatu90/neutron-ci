    init
    
    use: /home/jenkins-slave/runs/devstack_params.$ZUUL_UUID.txt
    run-tempest


use: /home/jenkins-slave/runs/devstack_params.$ZUUL_UUID.txt
collect




#!/bin/bash
jen_date=$(date +%d/%m/%Y-%H:%M)
set +e
set -o pipefail
/usr/local/src/neutron-ci/jobs/run_initialize.sh 2>&1 | tee -a /home/jenkins-slave/logs/console-$ZUUL_UUID.log
result_init=$?
echo "$ZUUL_PROJECT;$ZUUL_BRANCH;$jen_date;$ZUUL_CHANGE;$ZUUL_PATCHSET;init;$result" >> /home/jenkins-slave/neutron-statistics.log

if [ $result_init -eq 0 ]; then
    jen_date=$(date +%d/%m/%Y-%H:%M)
    source /home/jenkins-slave/runs/devstack_params.$ZUUL_UUID.txt
    /usr/local/src/neutron-ci/jobs/run_tests.sh 2>&1 | tee -a /home/jenkins-slave/logs/console-$ZUUL_UUID.log
    result_tempest=$?
    echo "$ZUUL_PROJECT;$ZUUL_BRANCH;$jen_date;$ZUUL_CHANGE;$ZUUL_PATCHSET;run;$result" >> /home/jenkins-slave/neutron-statistics.log
fi

jen_date=$(date +%d/%m/%Y-%H:%M)
source /home/jenkins-slave/runs/devstack_params.$ZUUL_UUID.txt
/usr/local/src/neutron-ci/jobs/run_collect.sh 
result_collect=$?

if [  ]

set -e
exit $result
