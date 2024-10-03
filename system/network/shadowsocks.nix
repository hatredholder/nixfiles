{ pkgs, secrets, ... }:

let
  ssconfig = pkgs.writeText "ssconfig.json"
  ''
    {
      "server": "127.0.0.1",
      "server_port": 443,
      "local_address": "localhost",
      "local_port": 1080,
      "method": "chacha20-ietf-poly1305",
      "password":"${secrets.shadowsocks.password}",
      "plugin": "${pkgs.cloak-pt}/bin/ck-client",
      "plugin_opts": "${ckconfig}"
    }
  '';
  ckconfig = pkgs.writeText "ckconfig.json"
  ''
    {
      "RemoteHost": "${secrets.shadowsocks.cloak.remote}",
      "UID": "${secrets.shadowsocks.cloak.uid}",
      "PublicKey": "${secrets.shadowsocks.cloak.pub}",
      "ProxyMethod": "shadowsocks",
      "EncryptionMethod": "plain",
      "ServerName": "dzen.ru",
      "AlternativeNames": ["mail.ru", "gosuslugi.ru", "kremlin.ru"]
    }
  '';
in
{
  systemd.services.shadowsocks-client = {
    description = "fast tunnel proxy client with the cloak plugin";
    wantedBy = ["network-online.target"];
    serviceConfig = {
      RestartSec = 3;
      Restart = "always";
    };
    script = ''
      exec ${pkgs.shadowsocks-rust}/bin/sslocal --config ${ssconfig}
    '';
  };
}
