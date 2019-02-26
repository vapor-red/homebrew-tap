class RedBackup < Formula
  depends_on 'colorize' => :ruby
  depends_on 'tty-prompt' => :ruby

  desc "Backup Vapor Red"
  url "https://red-scripts.ams3.digitaloceanspaces.com/red-backup-0.0.1.tar.gz"
  sha256 "e1562783c8ca824df3bfe921fb891ac13117fe606590de38a667ad7dcb1ec533"
  version "0.0.1"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"red-backup")
  end
end
