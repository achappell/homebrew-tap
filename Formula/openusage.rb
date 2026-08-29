# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.26.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.26.3/openusage_0.26.3_darwin_arm64.tar.gz"
      sha256 "5315e792303c8ee345d7fc12b48a0192dc483948a5d321873b5b4bbe8d438464"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.26.3/openusage_0.26.3_darwin_amd64.tar.gz"
      sha256 "a7f112128422a9500ce0e2a31990f7fa5ead0bec41f5c45aa506d00361002ebb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.26.3/openusage_0.26.3_linux_arm64.tar.gz"
      sha256 "d52d2b935654926309f3ccc8f1b224525927c834bd53f9a7125a1aef32853e8c"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.26.3/openusage_0.26.3_linux_amd64.tar.gz"
      sha256 "b93834b449c46e50b1a3f855f28ffbbfa6dea556d08294da1712b51fc06ee620"
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
