class RedPostgreSQLBackup < Formula
  desc "Backup Vapor Red PostgreSQL databases"
  url "https://red-scripts.ams3.digitaloceanspaces.com/postgresql-backup-0.0.1.tar.gz"
  sha256 "e4b7685fd2913b65bee80b1d85227cce2129bd545c7fc06bd486ac5285c1167a"
  version "0.0.1"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"psql-backup")
    bin.write_exec_script (libexec/"psql-backup-setup")
  end
end
