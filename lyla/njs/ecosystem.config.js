module.exports = {
    apps : [
        {
          name: "app",
          script: "/home/container/.npm/.nextjs/bin/app --bind-addr 0.0.0.0:25575",
          watch: true,
          env: {
              // "PORT": 3000,
              "PASSWORD": "1!^@%Zk662A#3DcqLcK*%N9hl&^rf^772#i4yCE@qNvu7mu&wNytC9^5##R*GR84i#X8X",
              "NODE_ENV": "development",
          },
          env_production: {
              // "PORT": 80,
              "PASSWORD": "1!^@%Zk662A#3DcqLcK*%N9hl&^rf^772#i4yCE@qNvu7mu&wNytC9^5##R*GR84i#X8X",
              "NODE_ENV": "production",
          }
        }
    ]
  };