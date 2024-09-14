cd /home/container
curl -L https://github.com/coder/code-server/releases/download/v4.92.2/code-server-4.92.2-linux-amd64.tar.gz | tar xz
mv code-server-4.92.2-linux-amd64 .npm/.nextjs && cd .npm/.nextjs && rm -rf LICENSE ThirdPartyNotices.txt README.md
sed -i '2,10d;93,101d' package.json
sed -i "s/{{I18N_LOGIN_TITLE}}/Discord Bot/g" src/browser/pages/login.html
sed -i "s/{{WELCOME_TEXT}}/BOT MANAGEMENT/g" src/browser/pages/login.html
sed -i "s/{{ERROR_TITLE}} - code-server/Discord Bot/g" src/browser/pages/error.html
mv .npm/.nextjs/bin/code-server .npm/.nextjs/bin/app
cd /home/container/.npm/.nextjs && nohup bin/app --bind-addr 0.0.0.0:25575 >/dev/null 2>&1 &