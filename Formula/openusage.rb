# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.28.0/openusage_0.28.0_darwin_arm64.tar.gz"
      sha256 "5e9738b85c7b5b03b7b755ee107e79c86b5d0659d4da3dcdf9f8a05808019877"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.28.0/openusage_0.28.0_darwin_amd64.tar.gz"
      sha256 "42d82511aaae10da171ae0d94aba0ac4500bb00cacf8874c2f3e4f07cc4fe39a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.28.0/openusage_0.28.0_linux_arm64.tar.gz"
      sha256 "24d29131248ad649a7916f7468edade4f79af8f36fe4338d6d0821b8dbdbbe74"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.28.0/openusage_0.28.0_linux_amd64.tar.gz"
      sha256 "5afdc5aa28575f79cc973465f2c0be895e06a3492df1cdbbea6dfea02ddad602"
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
