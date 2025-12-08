class Cwtch < Formula
  desc "Manage Claude Code profiles and sync configuration from Git"
  homepage "https://github.com/agh/cwtch"
  # renovate: datasource=github-releases depName=agh/cwtch
  url "https://github.com/agh/cwtch/archive/refs/tags/v5.0.0.tar.gz"
  sha256 "1d7b75735e9f09efd8a676618fad9368a9f93e32ff6cd6d2e7a4d83b9dd2f4bd"
  license "MIT"

  depends_on :macos
  depends_on "jq"
  depends_on "yq"

  def install
    libexec.install "bin"
    libexec.install "lib"
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
    assert_match "Usage:", shell_output("#{bin}/cwtch --help")
  end
end
