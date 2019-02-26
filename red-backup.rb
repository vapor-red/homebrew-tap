class RedBackup < Formula
  resource "colorize" do
    url "https://rubygems.org/downloads/colorize-0.8.1.gem"
    sha256 "0ba0c2a58232f9b706dc30621ea6aa6468eeea120eb6f1ccc400105b90c4798c"
  end

  resource "tty-prompt" do
    url "https://rubygems.org/downloads/tty-prompt-0.18.1.gem"
    sha256 "95c9bc8d70c6cb5aed5ae09914069e3db28b495c52787d4976c71e3f7fd654f2"
  end

  desc "Backup Vapor Red"
  url "https://red-scripts.ams3.digitaloceanspaces.com/red-backup-0.0.1.tar.gz"
  sha256 "e1562783c8ca824df3bfe921fb891ac13117fe606590de38a667ad7dcb1ec533"
  version "0.0.1"

  def install
    (lib/"red-backup/vendor").mkpath
    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system("gem", "install", r.cached_download, "--no-document", "--install-dir", "#{lib}/red-backup/vendor")
    end

    rm_rf "vendor"
    (bin/"red-backup").write(exec_script)

    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"red-backup")
  end

  def exec_script
    <<-EOS.undent
    #!/bin/bash
    export GEM_HOME="#{HOMEBREW_PREFIX}/lib/red-backup/vendor"
    export DISABLE_BUNDLER_SETUP=1
    exec ruby "#{libexec}/red-backup.rb" "$@"
    EOS
  end
end
