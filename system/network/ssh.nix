{
  services.openssh.enable = true;

  # ssh-agent on startup
  programs.ssh.startAgent = true;
}
