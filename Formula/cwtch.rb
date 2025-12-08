class Cwtch < Formula
  desc "Manage Claude Code profiles and sync configuration from Git"
  homepage "https://github.com/agh/cwtch"
  # renovate: datasource=github-releases depName=agh/cwtch
  url "https://github.com/agh/cwtch/archive/refs/tags/v5.1.0.tar.gz"
  sha256 "1c6ae28ea025cd4580539244304bdac8a8e85ff705361ac7999b80e27592697f"
  license "MIT"

  depends_on :macos
  depends_on "jq"
  depends_on "yq"

  def install
    libexec.install "bin"
    libexec.install "lib"
    libexec.install "VERSION"
    bin.install_symlink libexec/"bin/cwtch"
  end

  def caveats
    <<~EOS
      cwtch manages Claude Code profiles and syncs configuration from Git.

      Quick start:
        cwtch profile save work    # Save current session
        cwtch profile use personal # Switch profiles
        cwtch sync init            # Create Cwtchfile
        cwtch sync                 # Sync configuration from Git

      Note: This project is not affiliated with Anthropic PBC.
    EOS
  end

  test do
    assert_match "cwtch", shell_output("#{bin}/cwtch --help")
  end
end
