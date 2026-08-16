# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.25.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.25.1/openusage_0.25.1_darwin_arm64.tar.gz"
      sha256 "6fbd605f1279f7e82081b3d57b6a00d1aca6c837906e6ec1061eaad8b8467ab4"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.25.1/openusage_0.25.1_darwin_amd64.tar.gz"
      sha256 "227541a1de7b504e0d90c1edada20fc17a58b91ed31bf6a53e588a43a8a9087c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.25.1/openusage_0.25.1_linux_arm64.tar.gz"
      sha256 "c5abecd0d44455d684e7155fe0978cc41c94c6535884b68accb9cf41e7707195"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.25.1/openusage_0.25.1_linux_amd64.tar.gz"
      sha256 "d0fc15d367370191805c286cb4cda11febc1860d712bf3e99a1fc9572a78e28b"
    end
  end

  def install
    bin.install "openusage"
  end

  def caveats
    <<~EOS
      If `openusage` is missing after an install or upgrade, the keg is
      installed but unlinked. There are two known causes.

      1. Tap trust. Homebrew 6.0+ requires third-party taps to be trusted,
         and a trust grant only covers the formula version it was made for,
         so each `brew update` that bumps openusage can leave the keg
         unlinked. Trust the whole tap once to keep it linked across
         upgrades:

 brew trust achappell/tap

         See https://docs.brew.sh/Tap-Trust for details.

      2. Tap ambiguity. If another installed tap also defines a formula
         named "openusage", Homebrew cannot resolve the bare name and
         skips the link step. Check with:

 brew info --formula openusage

         An error reading "Formulae found in multiple taps" confirms it.
         Remove the tap you do not use, or always use the fully-qualified
         name.

      Either way, this restores the command immediately:

        brew link achappell/tap/openusage
    EOS
  end

  test do
    assert_match "openusage", shell_output("#{bin}/openusage --version 2>&1", 0)
  end
end
