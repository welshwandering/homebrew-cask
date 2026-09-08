class Cwtch < Formula
  desc "Manage Claude Code profiles and sync configuration from Git"
  homepage "https://github.com/agh/cwtch"
  # renovate: datasource=github-releases depName=agh/cwtch
  url "https://github.com/agh/cwtch/archive/refs/tags/v6.0.0.tar.gz"
  sha256 "35070bccbe73baa0ee35a3bf5dc19bb7c21711420e2215cb3cfce187859a115f"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "jq"
  depends_on :macos
  depends_on "yq"

  def install
    libexec.install "bin"
    libexec.install "lib"
    libexec.install "VERSION"
    bin.install_symlink libexec/"bin/cwtch"
  end

  def caveats
    <<~EOS
      Create and activate a setup-token profile:
        cwtch profile setup personal
        eval "$(cwtch profile env)"

      Configure Git synchronisation:
        cwtch sync init
        cwtch edit
        cwtch sync check
        cwtch sync

      This project is not affiliated with Anthropic PBC.
    EOS
  end

  test do
    ENV["HOME"] = testpath
    (testpath/".cwtch").mkpath
    (testpath/".cwtch/Cwtchfile").write("sources: []\n")

    assert_match "cwtch 6.0.0", shell_output("#{bin}/cwtch --version")
    system bin/"cwtch", "profile", "list"
    system bin/"cwtch", "sync", "check"
  end
end
