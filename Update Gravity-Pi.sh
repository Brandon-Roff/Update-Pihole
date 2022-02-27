#!/bin/sh

for num in `seq 54 55`
do
       clear
       host=192.168.195.${num}
       PASS=GreatIris2001@

#Colour Choices
COL_NC='\e[0m' # No Color
COL_LIGHT_GREEN='\e[1;32m'
COL_LIGHT_RED='\e[1;31m'

#symbols
TICK="[${COL_LIGHT_GREEN}✓${COL_NC}]"
CROSS="[${COL_LIGHT_RED}✗${COL_NC}]"       


  echo -e "
                    ${COL_LIGHT_GREEN}.;;,.
                    .ccccc:,.
                     :cccclll:.      ..,,
                      :ccccclll.   ;ooodc
                       'ccll:;ll .oooodc
                         .;cll.;;looo:.
                             ${COL_LIGHT_RED}.. ','.
                            .',,,,,,'.
                          .',,,,,,,,,,.
                        .',,,,,,,,,,,,....
                      ....''',,,,,,,'.......
                    .........  ....  .........
                    ..........      ..........
                    ..........      ..........
                   .........  ....  .........
                      ........,,,,,,,'......
                        ....',,,,,,,,,,,,.
                           .',,,,,,,,,'.
                            .',,,,,,'.
                             ..'''.${COL_NC}
"

echo ""
echo "           Pihole Gravity Update Started on "${host}""
echo "          -------------------------------------------------"
echo "                        Updating databases..."
echo "          -------------------------------------------------"
DEBIAN_FRONTEND=noninteractive sshpass -p ${PASS} ssh -l root -oStrictHostKeyChecking=accept-new "${host}" 'sudo pihole -g' > .pihole_update_"${host}"
echo -e "                     Gravity Updates Complete ${TICK}"
echo ""
sleep 2
echo ""
echo ""
echo ""
echo "               Pihole Update Started on "${host}""
echo "          -------------------------------------------------"
echo "                        Update Processing..."
echo "          -------------------------------------------------"
DEBIAN_FRONTEND=noninteractive sshpass -p ${PASS} ssh -l root -oStrictHostKeyChecking=accept-new "${host}" 'sudo pihole -up' >> .pihole_update_"${host}"
echo -e "                    Pihole Updates Complete ${TICK}"
sleep 6
clear



done

  echo -e "
                    ${COL_LIGHT_GREEN}.;;,.
                    .ccccc:,.
                     :cccclll:.      ..,,
                      :ccccclll.   ;ooodc
                       'ccll:;ll .oooodc
                         .;cll.;;looo:.
                             ${COL_LIGHT_RED}.. ','.
                            .',,,,,,'.
                          .',,,,,,,,,,.
                        .',,,,,,,,,,,,....
                      ....''',,,,,,,'.......
                    .........  ....  .........
                    ..........      ..........
                    ..........      ..........
                   .........  ....  .........
                      ........,,,,,,,'......
                        ....',,,,,,,,,,,,.
                           .',,,,,,,,,'.
                            .',,,,,,'.
                             ..'''.${COL_NC}
"
echo "               Pihole Updated Started on all severs"
echo "          -------------------------------------------------"
echo -e "                        Update Complete ${TICK}"
echo "          -------------------------------------------------"
