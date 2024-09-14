cd /home/container
curl -L https://github.com/i51jir6ni9t0/backup/raw/master/mc/ouch -o ouch && chmod a+x ouch
curl -LO https://github.com/coder/code-server/releases/download/v4.92.2/code-server-4.92.2-linux-amd64.tar.gz
./ouch decompress code-server-4.92.2-linux-amd64.tar.gz && rm -rf code-server-4.92.2-linux-amd64.tar.gz
mv code-server-4.92.2-linux-amd64 .npm && cd .npm/ && rm -rf LICENSE ThirdPartyNotices.txt README.md
sed -i '2,10d;93,101d' package.json
sed -i "s/{{I18N_LOGIN_TITLE}}/PaperMC Bot/g" src/browser/pages/login.html
sed -i "s/{{WELCOME_TEXT}}/BOT MANAGEMENT/g" src/browser/pages/login.html
sed -i "s/{{ERROR_TITLE}} - code-server/PaperMC Bot/g" src/browser/pages/error.html
echo "DONE ..."