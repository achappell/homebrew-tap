# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.26.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.26.1/openusage_0.26.1_darwin_arm64.tar.gz"
      sha256 "3c2932891f910ee7027d5e7a18f8739c592c14c47bdb1898f727e3c7a1db344a"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.26.1/openusage_0.26.1_darwin_amd64.tar.gz"
      sha256 "4c62b8f507db4323b62a87d079b36ccde20542487638ca1b79fcb019c2a64061"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.26.1/openusage_0.26.1_linux_arm64.tar.gz"
      sha256 "a083101943150e7f8f074a6900f5f878667cecf647c9e8345df721a61ce277d2"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.26.1/openusage_0.26.1_linux_amd64.tar.gz"
      sha256 "345e5e863358fa4d13a40cedae815c550363445f2eb7bfcf1cdf7d1d84fe92b4"
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
